

//*******************************************************************************
//  4 bit grey code adder
//*******************************************************************************
module FourBitGreyAdder (
			input  logic [3:0] grey,
  			input  logic [4:0] binary, 
  			output logic [3:0] binary1,
			output logic [3:0] binary2,
			output logic [4:0] grey1,
			output logic [3:0] sum,
  			output logic [3:0] cout);

integer i;
//*******************************************************************************
//  Grey to Binary Converter 1
//*******************************************************************************
   always_comb begin
     	binary1[3] = grey[3]; //Make initial first bit match
    		 for(i = 2; i >= 0; i = i-1)begin //check every bit after
      			 binary1[i] = grey[i]^binary1[i+1]; //output the XOR equation from above
			 end
     
      
//********************************************************************************
// Grey to Binary Converter 2
//********************************************************************************
     binary2[3] = grey[3]; //Make initial first bit match
     		for(i = 2; i >= 0; i = i-1)begin //check every bit after
      			 binary2[i] = grey[i]^binary2[i+1]; //output the XOR equation from above
			end

//*******************************************************************************
// Binary to Grey Converter
//******************************************************************************* 
     grey1[4] = binary[4]; //Make initial first bit match
			for(i = 3; i >= 0; i = i-1)begin 
          		grey1[i] = binary[i+1]^binary[i]; //output
			end   
   
//*******************************************************************************
// Adder 
//*******************************************************************************
  
	assign {cout,sum} = binary1 + binary2 + grey1;
  
   end

endmodule 
