<?php

namespace App\Http\Controllers\Api\Seller;

use App\Http\Controllers\Controller;
use App\Http\Requests\MedicineRequest;
use App\Models\Medicine;
use App\Models\Prescription;
use Illuminate\Http\Request;

class MedicineController extends Controller
{
    public function list(Request $request, $id)
    {
        try {
            $medicines = Medicine::where('pharmacy_id', $id)->get();

            return response()->json([
                'status' => true,
                'message' => 'List of Medicines.',
                'medicines' => $medicines
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function add(MedicineRequest $request, $id)
    {
        try {
            $medicine = Medicine::create([
                'name' => $request->name,
                'dosage' => $request->dosage,
                'price' => $request->price,
                'quantity' => $request->quantity,
                'status' => $request->status == true ? 1 : 0,
                'formula' => $request->formula,
                'image' => $request->hasFile('image') ? '/storage/' . $request->file('image')->store('medicines', 'public') : '',
                'category_id' => $request->category_id,
                'pharmacy_id' => $id,
                'is_verified' => $request->is_verified == true ? 1 : 0,
                'description' => $request->description
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Medicine successfully added.',
                'medicine' => $medicine
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function edit(Request $request, $id)
    {
        try {
            $medicine = Medicine::findOrFail($id);

            return response()->json([
                'status' => true,
                'message' => 'Get medicine record.',
                'medicine' => $medicine,
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function update(MedicineRequest $request, $id, $pharmacy_id)
    {
        try {
            $medicine = Medicine::findOrFail($id);

            $medicine->update([
                'name' => $request->name,
                'dosage' => $request->dosage,
                'price' => $request->price,
                'quantity' => $request->quantity,
                'status' => $request->status == true ? 1 : 0,
                'formula' => $request->formula,
                'image' => $request->hasFile('image') ? '/storage/' . $request->file('image')->store('medicines', 'public') : $medicine->image,
                'category_id' => $request->category_id,
                'pharmacy_id' => $pharmacy_id,
                'is_verified' => $request->is_verified == true ? 1 : 0,
                'description' => $request->description
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Medicine successfully updated.',
                'medicine' => $medicine
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function editStatus(Request $request)
    {
        try {
            $medicine = Medicine::findOrFail($request->medicine_id);

            $medicine->update([
                'status' => $request->status ? 1 : 0,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Status successfully updated.',
                'medicine' => $medicine
            ]);
            
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function delete(Request $request, $id)
    {
        try {
            $medicine = Medicine::findOrFail($id);

            if (!$medicine->orders->isEmpty()) {

                foreach ($medicine->orders as $order)
                {
                    $order->medicine_id = null;
                    $order->save();
                }
            }

            $medicine?->prescriptions()->delete();
            $medicine->delete();

            return response()->json([
                'status' => true,
                'message' => 'Medicine successfully deleted.',
            ]);

        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }

    public function prescriptions(Request $request, $id)
    {


        $planRelation = PlanRelation::where('packageid', $this->getProductID($request->packagePlan))->firstOrFail();
        $client = Client::findOrFail($id);
        $customfieldvalue = CustomFieldValue::where('relid', $id)->where('fieldid', 1)->firstOrFail();

        $order = Order::create([
            'ordernum' => $this->randomNumber(),
            'userid' => $id,
            'contactid' => 0,
            'date' => date('Y-m-d H:i:s'),
            'nameservers' => '',
            'transfersecret' => '',
            'renewals' => '',
            'promocode' => '',
            'promotype' => '',
            'promovalue' => '',
            'orderdata' => 'a:0:{}',
            'amount' => floor($planRelation->total), // 1.00
            'paymentmethod' => 'fastspring',
            'invoiceid' => 0,
            'status' => 'Pending',
            'ipaddress' => $this->get_client_ip(),
            'fraudmodule'   =>  '',
            'fraudoutput'   =>  '',
            'notes' => ' ',
            'agent' => '',
            'attachment' => '',
            'tr_session_id' => '',
            'is_manual' => 0
        ]);

        $hosting = Hosting::create([
            'userid' => $id,
            'orderid' => $order->id,
            'packageid' => $this->getProductID($request->packagePlan),
            'server' => 1,
            'regdate' => date('Y-m-d'),
            'domain' => '',
            'paymentmethod' => $order->paymentmethod,
            'firstpaymentamount' => floor($this->getTotalAmount($request->packagePlan, $planRelation->total)),
            'amount' =>  floor($this->getTotalAmount($request->packagePlan, $planRelation->total)),
            'billingCycle' => $planRelation->billingcycle,
            'nextduedate'       =>  $nextinvoicedate,
            'nextinvoicedate'   =>  $nextinvoicedate,
            'termination_date'  =>  date('0000-00-00'),
            'completed_date'    =>  date('0000-00-00'),
            'domainstatus'      =>  'Active',
            'username'          =>  $client->email,
            'password'          => $customfieldvalue->password,    
            'notes'             => ' ',
            'subscriptionid'    =>  '',
            'promoid'           =>  0,
            'suspendreason'     =>  '',
            'dedicatedip'       =>  $request->addon_id,
            'port_farwording'   =>  0,
            'assignedips'       =>  '',
            'ns1'               =>  '',
            'ns2'               =>  '',
        ]);

        $invoice    =   Invoice::create([
            'userid'        =>  $id,
            'paymentmethod' =>  $order->paymentmethod,
            'notes'         =>  '',
            'date'          =>  date('Y-m-d'),
            'duedate'       =>  date('Y-m-d'),
            'datepaid'      =>  date('Y-m-d H:i:s'),
            'last_capture_amount' =>  date('Y-m-d H:i:s'),
            'status'        =>  'Paid',
            'total'         =>  $planRelation->total,
        ]);

        InvoiceItem::create([
            'userid'        =>  $id,
            'invoiceid'     =>  $invoice->id,
            'type'          =>  'Hosting',
            'relid'         =>  $planRelation->product_id,
            'description'   =>  $planRelation->name,
            'amount'        =>  floor($this->setRecurringAmount($request->packagePlan)),
            'taxed'         =>  0,
            'notes'         =>  ' ',
        ]);

        InvoiceItem::create([
            'userid'        =>  $id,
            'invoiceid'     =>  $invoice->id,
            'type'          =>  'DedicatedIp',
            'relid'         =>  $request->addon_id,
            'description'   =>  'Dedicated Ip Assigned',
            'amount'        =>  $planRelation->total,
            'taxed'         =>  0,
            'duedate'           =>  $order->date,
            'paymentmethod' =>  $order->paymentmethod,
            'notes'         =>  ' ',
            'updated_at'    =>  date('Y-m-d h:i:s'), 
        ]);

        $account = Account::create([
            'userid'    =>  $invoice->userid,
            'gateway'   =>  $invoice->paymentmethod,
            'invoiceid' =>  $invoice->id,
            'description'=> "Invoice Payment",
            'transid'   =>  '',
            'fees'      =>  0,
            'amountin'  =>  $invoice->total
        ]);
        
        Orders::where('id',$order->id)->update([
            'invoiceid'     =>  $invoice->invoiceid,
        ]);

        HostingAddonMeta::create([
            'userid'   => $id,
            'qty'      => 1,
            'addonid' => $request->addon_id
        ]);

        radcheck::updateOrCreate([
            'username'  => $hosting->username
        ],
        [
            'attribute' => 'Cleartext-Password',
            'op'        => ':=',
            'value'     => $customfieldvalue->value,
            'cv'        => 0
        ]);

        radcheck::create([
            'username'  => $hosting->username,
            'attribute' => 'Simultaneous-use',
            'op'        => ':=',
            'value'     => $hosting->plan_detail->multilogin_allowed,
            'cv'        => 0
        ]);

        radreply::updateOrCreate([
            'username'  => $hosting->username
        ],
        [
            'attribute' => 'Acct-Interim-Interval',
            'op'        => ':=',
            'value'     => '300',
        ]);

        // Hosting
        // 3   1.6 + 1.6 = 3.2 - 3.00      monthly
        // 31  15.6 + 15.6 = 31.2 - 31.00  annually
        // 31.20 = 31.20  - 31.00          biannual

        // Order
        // 1.6 = 1.00   monthly
        // 15.6 = 15.00 annually
        // 31.2 = 31.00 biannual

        // function getTotalAmount($plan, $productPrice)
        // {            
        //     if ($plan != 'twoyears') {
        //         $productPrice += $productPrice;
        //     }

        //     return $productPrice;
        // }

        try {
            $prescriptions = Prescription::where('medicine_id', $id)->get();

            return response()->json([
                'status' => true,
                'message' => 'List of prescriptions.',
                'prescriptions' => $prescriptions
            ]);
        } catch (\Exception $exception) {
            return response()->json([
                'status' => false,
                'message' => $exception->getMessage()
            ]);
        }
    }
    
}