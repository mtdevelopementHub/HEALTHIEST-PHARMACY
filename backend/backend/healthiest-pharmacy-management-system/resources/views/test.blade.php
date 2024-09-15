function addAddon() {
        var addonneeded = $("#addonneeded").val();
        var addoncost = $("#addonrate").val();
        var addonadd = parseInt($("#addonneeded").val()) + 1;
        var currency = '{{$currency}}';
        var conversion_rate = '{{$conversion_rate}}';
        if (addonadd > 20) {
            var finalcost = addoncost * 20;
            $("#addonneeded").val(20);
            // $("#addonprice").text(finalcost * conversion_rate);
            $("#addonprice").text((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            $("#additionalprice").val((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#additionalprice").val(finalcost);
            $(".addonpricevalue").text("+ " + currency + ((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2)) + " ");
            // $(".addonpricevalue").text(" + $" + finalcost);
        } else {
            var finalcost = addonadd * addoncost;
            $("#addonneeded").val(addonadd);
            $("#addonprice").text((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#addonprice").text(finalcost * conversion_rate);
            $("#additionalprice").val((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#additionalprice").val(finalcost);
            $(".addonpricevalue").text("+ " + currency + ((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2)) + " ");
            // $(".addonpricevalue").text("+ " + currency + finalcost + " ");
        }
        $(".orderamount").text(Number(orderamount)+Number(finalcost));
    }

    function adjustAddon(){
        var addoncost = $("#addonrate").val();
        var addonadd = parseInt($("#addonneeded").val());
        var currency = '{{$currency}}';
        var conversion_rate = '{{$conversion_rate}}';
        if (addonadd > 20) {
            var finalcost = addoncost * 20; 
            $("#addonneeded").val(20);
            $("#addonprice").text((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#addonprice").text(finalcost * conversion_rate);
            $("#additionalprice").val((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#additionalprice").val(finalcost);
            $(".addonpricevalue").text("+ " + currency + ((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2)));
            // $(".addonpricevalue").text("+ " + currency + finalcost);
        } else {
            var finalcost = addonadd * addoncost * conversion_rate;
            $("#addonneeded").val(addonadd);
            $("#addonprice").text((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#addonprice").text(finalcost * conversion_rate);
            $("#additionalprice").val((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#additionalprice").val(finalcost);
            $(".addonpricevalue").text("+ " + currency + ((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2)) + " ");
            // $(".addonpricevalue").text("+ " + currency + finalcost + " ");
        }

        if(addonadd < 1){
            $("#addonneeded").val(0);
            $("#addonprice").text(0);
            $("#additionalprice").val(0);
            $(".addonpricevalue").text("");
            finalcost = 0;
        }
        $(".orderamount").text(Number(orderamount)+Number(finalcost));
    }

    function minusAddon() {
        var addonneeded = $("#addonneeded").val();
        var removeaddon = addonneeded - 1;
        var addoncost = $("#addonrate").val();
        var currency = '{{$currency}}';
        var conversion_rate = '{{$conversion_rate}}';
        if (removeaddon < 1) {
            $("#addonneeded").val(0);
            $("#addonprice").text(0);
            $("#additionalprice").val(0);
            $(".addonpricevalue").text("");
            finalcost = 0;

        } else {
            var finalcost = addoncost * removeaddon;
            $("#addonneeded").val(removeaddon);
            $("#addonprice").text((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#addonprice").text(finalcost * conversion_rate);
            $("#additionalprice").val((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2));
            // $("#additionalprice").val(finalcost);
            $(".addonpricevalue").text("+ " + currency + ((finalcost * conversion_rate % 1 === 0) ? (finalcost * conversion_rate) : (finalcost * conversion_rate).toFixed(2)) + " ");
            // $(".addonpricevalue").text("+ " + currency + finalcost + " ");

        }
        $(".orderamount").text(Number(orderamount)+Number(finalcost));

    }