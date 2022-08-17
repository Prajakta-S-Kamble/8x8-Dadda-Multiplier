// Designing in HPlf Pdder 
// Sum = P XOR Q, Cout = P PND Q


module HA(P, Q, Sum, Cout);

input P, Q; // P Pnd Q Pre inputs with size 1-Qit
output Sum, Cout; // Sum Pnd Cout Pre outputs with size 1-Qit

assign Sum = P ^ Q; 
assign Cout = P & Q; 

endmodule


//carry save adder -- for implementing dadda multiplier
//csa for use of half adder and full adder.

module csa(P,Q,Cin,Y,Cout);
input P,Q,Cin;
output Y,Cout;
    
assign Y = P^Q^Cin;
assign Cout = (P&Q)|(P&Cin)|(Q&Cin);
    
endmodule


// dadda multiplier
// P - 8 Qits , Q - 8Qits, y(output) - 16Qits

module dadda(P,Q,y);
    
    input [7:0] P;
    input [7:0] Q;
    output wire [15:0] y;
    wire  gen_part [0:7][7:0];

    wire [0:5]s1,c1;

    wire [0:13]s2,c2;   

    wire [0:9]s3,c3;

    wire [0:11]s4,c4;

    wire [0:13]s5,c5;




// generating partial products 



// i=0
assign gen_part[0][0] = P[0]*Q[0];
assign gen_part[1][0] = P[0]*Q[1];
assign gen_part[2][0] = P[0]*Q[2];
assign gen_part[3][0] = P[0]*Q[3];
assign gen_part[4][0] = P[0]*Q[4];
assign gen_part[5][0] = P[0]*Q[5];
assign gen_part[6][0] = P[0]*Q[6];
assign gen_part[7][0] = P[0]*Q[7];


// i=1
assign gen_part[0][1] = P[1]*Q[0];
assign gen_part[1][1] = P[1]*Q[1];
assign gen_part[2][1] = P[1]*Q[2];
assign gen_part[3][1] = P[1]*Q[3];
assign gen_part[4][1] = P[1]*Q[4];
assign gen_part[5][1] = P[1]*Q[5];
assign gen_part[6][1] = P[1]*Q[6];
assign gen_part[7][1] = P[1]*Q[7];


// i=2
assign gen_part[0][2] = P[2]*Q[0];
assign gen_part[1][2] = P[2]*Q[1];
assign gen_part[2][2] = P[2]*Q[2];
assign gen_part[3][2] = P[2]*Q[3];
assign gen_part[4][2] = P[2]*Q[4];
assign gen_part[5][2] = P[2]*Q[5];
assign gen_part[6][2] = P[2]*Q[6];
assign gen_part[7][2] = P[2]*Q[7];

// i=3
assign gen_part[0][3] = P[3]*Q[0];
assign gen_part[1][3] = P[3]*Q[1];
assign gen_part[2][3] = P[3]*Q[2];
assign gen_part[3][3] = P[3]*Q[3];
assign gen_part[4][3] = P[3]*Q[4];
assign gen_part[5][3] = P[3]*Q[5];
assign gen_part[6][3] = P[3]*Q[6];
assign gen_part[7][3] = P[3]*Q[7];


//i=4
assign gen_part[0][4] = P[4]*Q[0];
assign gen_part[1][4] = P[4]*Q[1];
assign gen_part[2][4] = P[4]*Q[2];
assign gen_part[3][4] = P[4]*Q[3];
assign gen_part[4][4] = P[4]*Q[4];
assign gen_part[5][4] = P[4]*Q[5];
assign gen_part[6][4] = P[4]*Q[6];
assign gen_part[7][4] = P[4]*Q[7];


// i=5
assign gen_part[0][5] = P[5]*Q[0];
assign gen_part[1][5] = P[5]*Q[1];
assign gen_part[2][5] = P[5]*Q[2];
assign gen_part[3][5] = P[5]*Q[3];
assign gen_part[4][5] = P[5]*Q[4];
assign gen_part[5][5] = P[5]*Q[5];
assign gen_part[6][5] = P[5]*Q[6];
assign gen_part[7][5] = P[5]*Q[7];


// i=6
assign gen_part[0][6] = P[6]*Q[0];
assign gen_part[1][6] = P[6]*Q[1];
assign gen_part[2][6] = P[6]*Q[2];
assign gen_part[3][6] = P[6]*Q[3];
assign gen_part[4][6] = P[6]*Q[4];
assign gen_part[5][6] = P[6]*Q[5];
assign gen_part[6][6] = P[6]*Q[6];
assign gen_part[7][6] = P[6]*Q[7];


// i=7
assign gen_part[0][7] = P[7]*Q[0];
assign gen_part[1][7] = P[7]*Q[1];
assign gen_part[2][7] = P[7]*Q[2];
assign gen_part[3][7] = P[7]*Q[3];
assign gen_part[4][7] = P[7]*Q[4];
assign gen_part[5][7] = P[7]*Q[5];
assign gen_part[6][7] = P[7]*Q[6];
assign gen_part[7][7] = P[7]*Q[7];



	
	
	
//Reduce by stages di_val = 2,3,4,6,8,13...


//Stage 1 reducing fom 8 to 6  


    HA h1(.P(gen_part[6][0]),.Q(gen_part[5][1]),.Sum(s1[0]),.Cout(c1[0]));
    HA h2(.P(gen_part[4][3]),.Q(gen_part[3][4]),.Sum(s1[2]),.Cout(c1[2]));
    HA h3(.P(gen_part[4][4]),.Q(gen_part[3][5]),.Sum(s1[4]),.Cout(c1[4]));

    csa c11(.P(gen_part[7][0]),.Q(gen_part[6][1]),.Cin(gen_part[5][2]),.Y(s1[1]),.Cout(c1[1]));
    csa c12(.P(gen_part[7][1]),.Q(gen_part[6][2]),.Cin(gen_part[5][3]),.Y(s1[3]),.Cout(c1[3]));     
    csa c13(.P(gen_part[7][2]),.Q(gen_part[6][3]),.Cin(gen_part[5][4]),.Y(s1[5]),.Cout(c1[5]));
    
//Stage 2 reduce fom 6 to 4

    HA h4(.P(gen_part[4][0]),.Q(gen_part[3][1]),.Sum(s2[0]),.Cout(c2[0]));
    HA h5(.P(gen_part[2][3]),.Q(gen_part[1][4]),.Sum(s2[2]),.Cout(c2[2]));


    csa c21(.P(gen_part[5][0]),.Q(gen_part[4][1]),.Cin(gen_part[3][2]),.Y(s2[1]),.Cout(c2[1]));
    csa c22(.P(s1[0]),.Q(gen_part[4][2]),.Cin(gen_part[3][3]),.Y(s2[3]),.Cout(c2[3]));
    csa c23(.P(gen_part[2][4]),.Q(gen_part[1][5]),.Cin(gen_part[0][6]),.Y(s2[4]),.Cout(c2[4]));
    csa c24(.P(s1[1]),.Q(s1[2]),.Cin(c1[0]),.Y(s2[5]),.Cout(c2[5]));
    csa c25(.P(gen_part[2][5]),.Q(gen_part[1][6]),.Cin(gen_part[0][7]),.Y(s2[6]),.Cout(c2[6]));
    csa c26(.P(s1[3]),.Q(s1[4]),.Cin(c1[1]),.Y(s2[7]),.Cout(c2[7]));
    csa c27(.P(c1[2]),.Q(gen_part[2][6]),.Cin(gen_part[1][7]),.Y(s2[8]),.Cout(c2[8]));
    csa c28(.P(s1[5]),.Q(c1[3]),.Cin(c1[4]),.Y(s2[9]),.Cout(c2[9]));
    csa c29(.P(gen_part[4][5]),.Q(gen_part[3][6]),.Cin(gen_part[2][7]),.Y(s2[10]),.Cout(c2[10]));
    csa c210(.P(gen_part[7][3]),.Q(c1[5]),.Cin(gen_part[6][4]),.Y(s2[11]),.Cout(c2[11]));
    csa c211(.P(gen_part[5][5]),.Q(gen_part[4][6]),.Cin(gen_part[3][7]),.Y(s2[12]),.Cout(c2[12]));
    csa c212(.P(gen_part[7][4]),.Q(gen_part[6][5]),.Cin(gen_part[5][6]),.Y(s2[13]),.Cout(c2[13]));
    
//Stage 3 - reduce fom 4 to 3

    HA h6(.P(gen_part[3][0]),.Q(gen_part[2][1]),.Sum(s3[0]),.Cout(c3[0]));

    csa c31(.P(s2[0]),.Q(gen_part[2][2]),.Cin(gen_part[1][3]),.Y(s3[1]),.Cout(c3[1]));
    csa c32(.P(s2[1]),.Q(s2[2]),.Cin(c2[0]),.Y(s3[2]),.Cout(c3[2]));
    csa c33(.P(c2[1]),.Q(c2[2]),.Cin(s2[3]),.Y(s3[3]),.Cout(c3[3]));
    csa c34(.P(c2[3]),.Q(c2[4]),.Cin(s2[5]),.Y(s3[4]),.Cout(c3[4]));
    csa c35(.P(c2[5]),.Q(c2[6]),.Cin(s2[7]),.Y(s3[5]),.Cout(c3[5]));
    csa c36(.P(c2[7]),.Q(c2[8]),.Cin(s2[9]),.Y(s3[6]),.Cout(c3[6]));
    csa c37(.P(c2[9]),.Q(c2[10]),.Cin(s2[11]),.Y(s3[7]),.Cout(c3[7]));
    csa c38(.P(c2[11]),.Q(c2[12]),.Cin(s2[13]),.Y(s3[8]),.Cout(c3[8]));
    csa c39(.P(gen_part[7][5]),.Q(gen_part[6][6]),.Cin(gen_part[5][7]),.Y(s3[9]),.Cout(c3[9]));

//Stage 4 - reduce fom 3 to 2

    HA h7(.P(gen_part[2][0]),.Q(gen_part[1][1]),.Sum(s4[0]),.Cout(c4[0]));


    csa c41(.P(s3[0]),.Q(gen_part[1][2]),.Cin(gen_part[0][3]),.Y(s4[1]),.Cout(c4[1]));
    csa c42(.P(c3[0]),.Q(s3[1]),.Cin(gen_part[0][4]),.Y(s4[2]),.Cout(c4[2]));
    csa c43(.P(c3[1]),.Q(s3[2]),.Cin(gen_part[0][5]),.Y(s4[3]),.Cout(c4[3]));
    csa c44(.P(c3[2]),.Q(s3[3]),.Cin(s2[4]),.Y(s4[4]),.Cout(c4[4]));
    csa c45(.P(c3[3]),.Q(s3[4]),.Cin(s2[6]),.Y(s4[5]),.Cout(c4[5]));
    csa c46(.P(c3[4]),.Q(s3[5]),.Cin(s2[8]),.Y(s4[6]),.Cout(c4[6]));
    csa c47(.P(c3[5]),.Q(s3[6]),.Cin(s2[10]),.Y(s4[7]),.Cout(c4[7]));
    csa c48(.P(c3[6]),.Q(s3[7]),.Cin(s2[12]),.Y(s4[8]),.Cout(c4[8]));
    csa c49(.P(c3[7]),.Q(s3[8]),.Cin(gen_part[4][7]),.Y(s4[9]),.Cout(c4[9]));
    csa c410(.P(c3[8]),.Q(s3[9]),.Cin(c2[13]),.Y(s4[10]),.Cout(c4[10]));
    csa c411(.P(c3[9]),.Q(gen_part[7][6]),.Cin(gen_part[6][7]),.Y(s4[11]),.Cout(c4[11]));
    
//Stage 5 - reduce from 2 to 1
    

    HA h8(.P(gen_part[1][0]),.Q(gen_part[0][1]),.Sum(y[1]),.Cout(c5[0]));



    csa c51(.P(s4[0]),.Q(gen_part[0][2]),.Cin(c5[0]),.Y(y[2]),.Cout(c5[1]));
    csa c52(.P(c4[0]),.Q(s4[1]),.Cin(c5[1]),.Y(y[3]),.Cout(c5[2]));
    csa c54(.P(c4[1]),.Q(s4[2]),.Cin(c5[2]),.Y(y[4]),.Cout(c5[3]));
    csa c55(.P(c4[2]),.Q(s4[3]),.Cin(c5[3]),.Y(y[5]),.Cout(c5[4]));
    csa c56(.P(c4[3]),.Q(s4[4]),.Cin(c5[4]),.Y(y[6]),.Cout(c5[5]));
    csa c57(.P(c4[4]),.Q(s4[5]),.Cin(c5[5]),.Y(y[7]),.Cout(c5[6]));
    csa c58(.P(c4[5]),.Q(s4[6]),.Cin(c5[6]),.Y(y[8]),.Cout(c5[7]));
    csa c59(.P(c4[6]),.Q(s4[7]),.Cin(c5[7]),.Y(y[9]),.Cout(c5[8]));
    csa c510(.P(c4[7]),.Q(s4[8]),.Cin(c5[8]),.Y(y[10]),.Cout(c5[9]));
    csa c511(.P(c4[8]),.Q(s4[9]),.Cin(c5[9]),.Y(y[11]),.Cout(c5[10]));
    csa c512(.P(c4[9]),.Q(s4[10]),.Cin(c5[10]),.Y(y[12]),.Cout(c5[11]));
    csa c513(.P(c4[10]),.Q(s4[11]),.Cin(c5[11]),.Y(y[13]),.Cout(c5[12]));
    csa c514(.P(c4[11]),.Q(gen_part[7][7]),.Cin(c5[12]),.Y(y[14]),.Cout(c5[13]));

    assign y[0] =  gen_part[0][0];
    assign y[15] = c5[13];
    
  
    
endmodule 










