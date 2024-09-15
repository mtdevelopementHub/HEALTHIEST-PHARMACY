<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <div id="mydiv">Hello, this a Test Page</div>



    <!-- ?iclid=1-1ffa6161-ea6a-327a-807a-826aea6161fa -->






    <script>
        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 *
                1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" +
                expires + ";path=/";
        }
        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie =
                decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }
        function saveClickId(qparam) {
            //Get iclid and save to Cookie
            var urlParams = new
                URLSearchParams(window.location.search);
            if (urlParams.has(qparam)) {
                var iclid = urlParams.get(qparam);
                setCookie(qparam, iclid, 60);
            }
        }

        (function () {
            //read new value with name iclid
            saveClickId('iclid');

            var iclid = getCookie("iclid");
            console.log(iclid);

            //show value in Browser
            // var para = document.createElement("P");
            // var t = document.createTextNode("This is the ID: " +
            //     getCookie('iclid'));
            // para.appendChild(t);
            // document.getElementById("mydiv").appendChild(para);
        })();
    </script>





    <!-- Onpage tag - GSG tracking solution code for click and pageimpression version 5.00 -->
    <script type="text/javascript">

        (function () {

            window.itsClickPI = {

                // This is the web page address OR a short description of the conversion page.
                // Examples: www.shop.com/dresses/red-dress123.html, Check-Out, Registration Complete
                siteId: 'http://local.healthiest-pharmacy-management-system.com/test',

                //A session Id
                sessionId: '${SESSION_ID}',

                // Unique identifier of the product. Use this, if this is a page that displays a specific product.
                productId: '${PRODUCT_ID}',

                // The complete Browser-URL on which the tag was fired. Used to increase accuracy in case of strict referrer browser policy.
                locationHref: window.location.href,
                locationRrf: window.document.referrer,


                // DO NOT CHANGE. The following parameters are used to identify the advertiser and the tracking domain.
                advId: '94992',
                trcDomain: 'gbskwe.joingsg.com'

            };

            console.log(window.itsClickPI);
            // DO NOT CHANGE. The following lines assure tracking functionality.
            var en = function (v) { if (v) { if (typeof (encodeURIComponent) == 'function') { return (encodeURIComponent(v)); } return (escape(v)); } }; var ts = function () { var d = new Date(); var t = d.getTime(); return (t); }; var im = function (s) { if (document.images) { if (typeof (ia) != 'object') { var ia = new Array(); } var i = ia.length; ia[i] = new Image(); ia[i].src = s; ia[i].onload = function () { }; } else { document.write('<img src="' + s + '" height="1" width="1" border="0" alt="" style="display:none;">'); } }; var pr = 'https:'; var cp = function (o) { var v = 'tst=' + ts(); if (o.siteId) { v += '&sid=' + en(o.siteId); } if (o.locationRrf) { v += '&rrf=' + en(o.locationRrf); } if (o.locationHref) { v += '&hrf=' + en(o.locationHref); } v += '&ver=' + en('5.00'); if (o.paramRef) { v += '&prf=' + en(o.paramRef); } if (o.userVal1) { v += '&uv1=' + en(o.userVal1); } if (o.userVal2) { v += '&uv2=' + en(o.userVal2); } if (o.custId) { v += '&csi=' + en(o.custId); } if (o.sessionId) { v += '&session=' + en(o.sessionId); } if (o.productId) { v += '&pid=' + en(o.productId); } v += '&rmd=0'; var s = (screen.width) ? screen.width : '0'; s += 'X'; s += (screen.height) ? screen.height : '0'; s += 'X'; s += (screen.colorDepth) ? screen.colorDepth : '0'; v += '&scr=' + s; v += '&nck='; v += (navigator.cookieEnabled) ? navigator.cookieEnabled : 'null'; v += '&njv='; v += (navigator.javaEnabled()) ? navigator.javaEnabled() : 'null'; if (o.gdpr) { v += '&gdpr=' + en(o.gdpr); } if (o.gdprConsent) { v += '&gdpr_consent=' + en(o.gdprConsent); } return (v); }; var itsStartCPI = function (o) { var s = pr + '//' + o.trcDomain + '/ts/' + o.advId + '/tsc?' + cp(o); im(s); }; itsStartCPI(itsClickPI);

            var a = document.createElement('script'); a.type = 'text/javascript'; a.async = true; a.src = 'https://' + itsClickPI.trcDomain + '/scripts/ts/' + itsClickPI.advId + 'contC.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(a, s);
        })();</script>
    <noscript>
        <!-- SET THE SAME VALUES FOR THE NOSCRIPT PART HERE -->
        <!-- Any ${PLACEHOLDER_NAME} needs to be replaced -->
        <!-- Special characters have to be URL-encoded. -->
        <!-- gdpr: '0' GDPR does not apply; '1' GDPR applies -->
        <!-- gdpr_consent: Only meaningful if gdpr=1. URL-safe base64-encoded TC string obtained from the CMP JS API or OpenRTB. Must contain consent for Vendor ID of advertiser or for 871 as default  -->
        <img src="https://gbskwe.joingsg.com/ts/94992/tsc?&rmd=0&sid=${SITE_ID}&session=${SESSION_ID}&pid=${PRODUCT_ID}&rrf=${HTTP_REFERRER}&hrf=${HTTP_HREF}&ver=5.00"
            width="1" height="1" border="0" style="display:none;">
    </noscript>



    <!-- Conversion tag - BEGIN GSG TRACKING CODE version 5.00 -->
    <!-- Any ${PLACEHOLDER_NAME} needs to be replaced -->
    <script type="text/javascript">
            var itsConv = {

            // MANDATORY FIELDS
            // This is the product category for this conversion target.
            // Important: The value for this product category needs to be set in your network configuration beforehand.
            trcCat: 'basket',

            // This is the name of the conversion target.
            // Important: The value for this conversion target needs to be set in your network configuration beforehand.
            // Your possible conversion targets are: 'sale',
            convTarget: 'sale',


            // Unique conversion identifier from your system. Examples: OrderID, CustomerID, LeadID.
            convId: '${CONVERSION_ID}',


            // A session ID.
            sessionId: '${SESSION_ID}',

            // A comma-separated list with clickId's from Ingenious, Google, Facebook etc.
            clickIds: ['${CLICK_IDS}'],


            // This is the ISO currency code (ISO 4217). Examples: 'EUR', 'GBP', 'CHF'.
            ordCurr: 'EUR',

            // Applied discount code.
            discCode: '${DISCOUNT_CODE}',

            // New or existing customer. Use value 'true' for new customer or 'false' for existing customer.
            isCustNew: '${CUSTOMER_NEW}',

            // Specifies the customer payment method.
            payMethod: '${PAYMENT_METHOD}',

            //Example of detailed shopping basket information:
            //id : Unique position Id (int)
            //pid: Unique product Id
            //sku: Stock Keeping Unit
            //prn: Product name
            //brn: Brand name
            //prc: Product category hierarchy, using '.' as delimiter. Example: 'Women.Clothing.Shoes'
            //pri: Product price
            //qty: Quantity of units in this position
            //dsv: Discount of this position
            //shp: Shipping costs of this position
            //tax: Tax of this position
            //trc: Category for commission
            basket: [{
                "id": "${POSITION_ID}",
                "pid": "${PRODUCT_ID}",
                "sku": "${PRODUCT_SKU}",
                "prn": "${PRODUCT_NAME}",
                "brn": "${PRODUCT_BRAND}",
                "prc": "${PRODUCT_HIERARCHY}",
                "pri": "${ PRODUCT_PRICE }",
                "qty": "${ PRODUCT_QUANTITY }",
                "dsv": "${ PRODUCT_DISCOUNT }",
                "shp": "${ PRODUCT_SHIPPING }",
                "tax": "${ PRODUCT_TAX }",
                "trc": "default",
      }],


            // The complete Browser-URL on which the tag was fired. Used to increase accuracy in case of strict referrer browser policy.
            locationHref: window.location.href,

            // DO NOT CHANGE. The following parameters are used to identify the advertiser in the network.
            advId: '94992',
            trcDomain: 'gbskwe.joingsg.com'

  };

  console.log(itsConv);

        // DO NOT CHANGE. The following lines assure tracking functionality.
        en = function (v) { if (v) { if (typeof (encodeURIComponent) == 'function') { return (encodeURIComponent(v)); } return (escape(v)); } }; ts = function () { var d = new Date(); var t = d.getTime(); return (t); }; im = function (s) {
            if (document.images) {
                if (typeof (ia) != "object") {
                    var ia = new Array();
                }; var i = ia.length; ia[i] = new Image(); ia[i].src = s; ia[i].onload = function () { };
            } else { document.write('<img src="' + s + '" height="1" width="1" border="0" alt="" style="display:none;">'); }
        }; var pr = 'https:';
        fr = function (s) {
            var d = document; var i = d.createElement("iframe"); i.src = s; i.frameBorder = 0; i.width = 0; i.height = 0; i.vspace = 0; i.hspace = 0; i.marginWidth = 0; i.marginHeight = 0; i.scrolling = "no"; i.allowTransparency = true; i.style.display = "none"; try { d.body.insertBefore(i, d.body.firstChild); } catch (e) {
                d.write('<ifr' + 'ame' + ' src="' + s + '" width="0" height="0" frameborder="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="true" style="display:none;"></ifr' + 'ame>');
            }
        }; ap = function (o) {
            var v = 'tst=' + ts(); if (o.trcCat) { v += '&trc=' + en(o.trcCat); }
            v += '&ctg=' + en(o.convTarget); v += '&cid=' + en(o.convId); if (o.ordValue) { v += '&orv=' + en(o.ordValue); } if (o.ordCurr) { v += '&orc=' + en(o.ordCurr); } if (o.discValue) { v += '&dsv=' + en(o.discValue); } if (o.discCode) { v += '&dsc=' + en(o.discCode); }
            if (o.invValue) { v += '&inv=' + en(o.invValue); } if (o.payMethod) { v += '&pmt=' + en(o.payMethod); } if (o.userVal1) { v += '&uv1=' + en(o.userVal1); } if (o.userVal2) { v += '&uv2=' + en(o.userVal2); } if (o.userVal3) {
                v += '&uv3=' + en(o.userVal3);
            } if (o.userVal4) { v += '&uv4=' + en(o.userVal4); } if (o.isCustNew) { var n = o.isCustNew.toLowerCase(); v += '&csn='; v += (n == "true" || n == "false") ? n : "null"; } if (o.custId) { v += '&csi=' + en(o.custId); } if (o.sessionId) { v += '&session=' + en(o.sessionId); } if (o.basket) { v += '&bsk=' + en(JSON.stringify(o.basket)); } if (o.uniqid) { v += '&uniqid=' + en(o.uniqid); } if (o.clickIds && o.clickIds.length > 0) { v += '&cli=' + en(o.clickIds.join('%2C')); } if (o.siteId) { v += '&sid=' + en(o.siteId); } if (o.adspaceId) { v += '&adspace=' + en(o.adspaceId); } var s = (screen.width) ? screen.width : "0";
            s += "X"; s += (screen.height) ? screen.height : "0"; s += "X"; s += (screen.colorDepth) ? screen.colorDepth : "0"; v += '&scr=' + s; v += '&nck='; v += (navigator.cookieEnabled) ? navigator.cookieEnabled : "null"; v += '&njv='; v += (navigator.javaEnabled()) ? navigator.javaEnabled() : "null"; if (o.locationHref) { v += '&hrf=' + en(o.locationHref); } if (o.gdpr) { v += '&gdpr=' + en(o.gdpr); } if (o.gdprConsent) { v += '&gdpr_consent=' + en(o.gdprConsent); } v += '&ver=' + en('5.00'); return (v);
        };
        itsStartConv = function (o) { var s = pr + '//' + o.trcDomain + '/ts/' + o.advId + '/tsa?typ=f&' + ap(o); fr(s); }; itsStartConv(itsConv);

        var a = document.createElement('script'); a.type = 'text/javascript'; a.async = true; a.src = 'https://' + itsConv.trcDomain + '/scripts/ts/' + itsConv.advId + 'contA.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(a, s);

    </script>
    <noscript>
        <!-- ------------ SET THE PARAMETERS FOR NOSCRIPT PART HERE ---------------- -->
        <!-- The parameter values have to be set in realtime. Every special characters have to be URL-encoded. -->
        <!-- Any ${PLACEHOLDER_NAME} needs to be replaced -->
        <!-- gdpr: '0' GDPR does not apply; '1' GDPR applies -->
        <!-- gdpr_consent: Only meaningful if gdpr=1. URL-safe base64-encoded TC string obtained from the CMP JS API or OpenRTB. Must contain consent for Vendor ID of advertiser or for 871 as default  -->
        <img src="https://gbskwe.joingsg.com/ts/94992/tsa?typ=i&trc=basket&ctg=sale&cid=${CONVERSION_ID}&orv=${ORDER_VALUE}&orc=EUR&pmt=${PAYMENT_METHOD}&dsc=${DISCOUNT_CODE}&csn=${CUSTOMER_NEW}&session=${SESSION_ID}&bsk=%5B%7B
%22trc%22%3A%22default%22
%2C%22pid%22%3A%22${PRODUCT_ID}%22%2C%22sku%22%3A%22${PRODUCT_SKU}%22%2C%22prn%22%3A%22${PRODUCT_NAME}%22%2C%22brn%22%3A%22${PRODUCT_BRAND}%22%2C%22prc%22%3A%22${PRODUCT_HIERARCHY}%22%2C%22pri%22%3A%22${PRODUCT_PRICE}%22%2C%22qty%22%3A%22${PRODUCT_QUANTITY}%22%2C%22dsv%22%3A%22${PRODUCT_DISCOUNT}%22%2C%22shp%22%3A%22${PRODUCT_SHIPPING}%22%2C%22tax%22%3A%22${PRODUCT_TAX}%22%2C%22id%22%3A%22${POSITION_ID}%22%7D%5D&cli=${CLICK_IDS}&ver=5.00"
            width="1" height="1" border="0" style="display:none;">
    </noscript>
    <!-- END GSG TRACKING CODE -->






</body>

</html>