public class GstDiscountWIthTaxableAndTotalAmount {
	float withoutDiscount,withDiscount,withoutGST,withGST,dis_cal,gst_cal,withGstDiscount,final_amt;
	void category_based_calculation(float price,float quantity,int dis,int GST) {
		float original_price = price;
		float qty = quantity;
		int discount = dis;
		int gst = GST;

		withoutDiscount = original_price + (original_price * gst)/100;
		withDiscount = withoutDiscount - (withoutDiscount * discount)/100;
		withoutGST = original_price - (original_price * discount)/100;
		withGST = withoutGST + (withoutGST * gst)/100;
		System.out.println("Taxable_Amount for Category_Based_Discount : " + withoutDiscount);
		System.out.println("Total_Amount for Category_Based_Discount : " + withDiscount);
		System.out.println("\nTaxable_Amount for Category_Based_GST : " + withoutGST);
		System.out.println("Total_Amount for Category_Based_GST : " + withGST);
		
		dis_cal = original_price - (original_price * discount)/100;
		gst_cal = dis_cal + (dis_cal * gst)/100;
		withGstDiscount = gst_cal;
		final_amt = withGstDiscount * qty;
		System.out.println("\nCalculated GST and Discount for per_product: "+withGstDiscount);
		System.out.println("Final Value: "+final_amt);
		System.out.println("\nHappy Shopping..");
	}
}

