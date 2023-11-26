import java.util.*;
public class DiscountWithGstForAProduct {
	public static void main(String args[]) {
		int id,discount,gst;
		float qty,original_price;
		Scanner s = new Scanner(System.in);
	    System.out.println("Enter the Product id :");
	    id = s.nextInt();
	    System.out.println("Enter the original price without gst and discount");
	    original_price = s.nextFloat();
	    System.out.println("Enter the quantity:");
	    qty = s.nextFloat(); 
	    GstDiscountWIthTaxableAndTotalAmount taxable_total_amt = new GstDiscountWIthTaxableAndTotalAmount();
	    switch(id){
	    case 1:{
	    	discount = 25;
	    	gst = 0;
	    	taxable_total_amt.category_based_calculation(original_price,qty,discount,gst);
	    	break;	
	    	}
	    case 2:{
	    	discount = 17;
	    	gst = 5;
	    	taxable_total_amt.category_based_calculation(original_price,qty,discount,gst);
    		break;	
    	}
	    case 3:{
	    	discount = 12;
	    	gst = 12;
	    	taxable_total_amt.category_based_calculation(original_price,qty,discount,gst);
    		break;	
    	}
	    case 4:{
	    	discount = 9;
	    	gst = 18;
	    	taxable_total_amt.category_based_calculation(original_price,qty,discount,gst);
    		break;	
    	}
	    case 5:{
	    	discount = 30;
	    	gst = 10;
	    	taxable_total_amt.category_based_calculation(original_price,qty,discount,gst);
    		break;	
    	}
	    }	
	}
}



