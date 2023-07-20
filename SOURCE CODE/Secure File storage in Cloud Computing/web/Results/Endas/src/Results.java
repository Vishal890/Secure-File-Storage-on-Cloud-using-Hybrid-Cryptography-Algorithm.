import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
 
public class Results
 
 {
public static void main(String[] args)
 
{	 
	 int count=0;
	 int count1=0;
	 int count2=0;
	 int count3=0;

	 String d="";
	
	    	try
	    	{
	    		 Class.forName("com.mysql.jdbc.Driver");	
	    		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/endas","root","root");
	    		Statement st=con.createStatement();
	    		
	    		ResultSet rs=st.executeQuery("select * from transaction");
	    		
	    		while(rs.next()==true)
	    		{
	    		d=rs.getString("task");	
	    		 if(d.equalsIgnoreCase("Download"))
	    		 {
	    			count++;
	    		 }
	    		 
	    		 if(d.equalsIgnoreCase("Upload"))
	    		 { 
	    				count1++; 
	    		 }
	    		 	 
	    		}
	    		
	    		DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
	  	        dataSet.setValue(count, "No of Download Records","Download");
	  	        dataSet.setValue(count1,"No of Upload Records", "Upload");
	  	        dataSet.setValue(count2,"", "");
	  	        dataSet.setValue(count3,"","");
	    	        
	    	        JFreeChart chart = ChartFactory.createBarChart3D(
	    	                "EnDAS: Efficient Encrypted Data Search as a Mobile Cloud Service ", "Transaction Details ", "No.Of Transaction",
	    	                dataSet, PlotOrientation.VERTICAL, true, true, true);
	    	        ChartFrame chartFrame=new ChartFrame("Cloud Transaction Details",chart);
	    	        chartFrame.setVisible(true);
	    	     
	    	        chartFrame.setSize(800,500);
	    		 
	        
	    	}
	    	catch(Exception ex)
	    	{
	    	System.out.println(ex);	
	    		
	    	}
	
   
}
}