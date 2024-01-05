module test(

	output reg [7:0] r,g,b,
	output reg[3:0] COMM,com,
	output reg gameover,
	output reg na,nb,nc,nd,ne,nf,ng,
	input up,down,left,right,enter,test,CLK

);
	
	reg [3:0]number1,number2,number3,number4;
	
	bit [2:0] Gcnt;
	bit [2:0] Bcnt;
	
	divfreq F0(CLK,CLK_div,out);

	reg [3:0]posx = 0;
	reg [3:0]posy = 0;
	
	initial begin
		na = 0;
		nb = 0;
		nc = 0;
		nd = 0;
		ne = 0;
		nf = 0;
		ng = 1;
		
		number1 <= 4'b0000;
		number2 <= 4'b0000;
		number3 <= 4'b0000;
		number4 <= 4'b0000;
		gameover = 0;
		posx = 0;
		posy = 0;
		Gcnt = 3'b000;
		Bcnt = 3'b000;
		r = 8'b11111111;
		g = 8'b11111111;
		b = 8'b11111111;
		COMM = 4'b1000;
		com = 4'b1110;
	end

	reg [0:0]Bmap[0:7][0:7];
	reg [0:0]Gmap[0:7][0:7];
	// Initialize Bmap array
  initial begin
    for (integer i = 0; i <= 7; i = i + 1) begin
      for (integer j = 0; j <= 7; j = j + 1) begin
        Bmap[i][j] = 1'b1; // Initialize to 0
      end
    end
  end

  // Initialize Gmap array
  initial begin
    for (integer i = 0; i <= 7; i = i + 1) begin
      for (integer j = 0; j <= 7; j = j + 1) begin
        Gmap[i][j] = 1'b0; // Initialize to 0
      end
    end
  end
	
	always@(posedge out)begin
	
		if(up)begin
		
			if(posx > 0)begin
		
				posx <= posx - 1'b1;
		
			end
		
		end
		if(down)begin
		
			if(posx < 7)begin
		
				posx <= posx + 1'b1;
		
			end
		
		end
		if(right)begin
		
			if(posy < 7)begin
		
				posy <= posy + 1'b1;
		
			end
		
		end
		if(left)begin
		
			if(posy > 0)begin
		
				posy <= posy - 1'b1;
		
			end
		
		end
	
	end
	
reg iswin = 0;
	
	always@(posedge out)begin
	
	iswin = 0;
	
	for(integer i = 0;i<=7;i = i+1)begin
		
			for(integer j = 0;j<=7;j=j+1)begin
			
				if(Gmap[i][j] == 1'b1)begin
				
					iswin = 1;
				
				end
			
			end
		
		end

		if(~iswin)
			gameover = 1;
		else
			gameover = 0;

		if(enter)begin
		
		number1 <= number1 + 1'b1;
		
		if(posx>0)
			Gmap[posx-1'b1][posy] <= ~Gmap[posx-1'b1][posy];
		if(posx<7)
		   Gmap[posx+1'b1][posy] <= ~Gmap[posx+1'b1][posy];
		if(posy>0)
			Gmap[posx][posy-1'b1] <= ~Gmap[posx][posy-1'b1];
		if(posy<7)
			Gmap[posx][posy+1'b1] <= ~Gmap[posx][posy+1'b1];
			
			
		if(number1 == 4'b1010)begin
		
			number1 <= 4'b0000;
			number2 <= number2+1'b1;
		
		end
		if(number2 == 4'b1010)begin
		
			number2 <= 4'b0000;
			number3 <= number3+1'b1;
		
		end
		if(number3 == 4'b1010)begin
		
			number3 <= 4'b000;
			number4 <= number4+1'b1;
		
		end
		if(number4>=10)number4 <= 4'b000;
		
		
		
		
		end
	
	end
	
	always@(posedge CLK_div)begin
	
		if(Gcnt >= 7)
				Gcnt = 0;
		else Gcnt =  Gcnt + 1;
		COMM = {1'b1,Gcnt};
			
		g = {Gmap[7][Gcnt],Gmap[6][Gcnt],Gmap[5][Gcnt],Gmap[4][Gcnt],Gmap[3][Gcnt],Gmap[2][Gcnt],Gmap[1][Gcnt],Gmap[0][Gcnt]};
		Bmap[posx][posy] = 1'b0;
		b = {Bmap[7][Gcnt],Bmap[6][Gcnt],Bmap[5][Gcnt],Bmap[4][Gcnt],Bmap[3][Gcnt],Bmap[2][Gcnt],Bmap[1][Gcnt],Bmap[0][Gcnt]};
		Bmap[posx][posy] = 1'b1;
		
		if(com == 4'b1110)begin
		
			unique case(number1)
				4'b0000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000001;
				4'b0001:{na,nb,nc,nd,ne,nf,ng} = 7'b1001111;
				4'b0010:{na,nb,nc,nd,ne,nf,ng} = 7'b0010010;
				4'b0011:{na,nb,nc,nd,ne,nf,ng} = 7'b0000110;
				4'b0100:{na,nb,nc,nd,ne,nf,ng} = 7'b1001100;
				4'b0101:{na,nb,nc,nd,ne,nf,ng} = 7'b0100100;
				4'b0110:{na,nb,nc,nd,ne,nf,ng} = 7'b0100000;
				4'b0111:{na,nb,nc,nd,ne,nf,ng} = 7'b0001111;
				4'b1000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000000;
				4'b1001:{na,nb,nc,nd,ne,nf,ng} = 7'b0000100;
			endcase
			
		end
		if(com == 4'b0111)begin
		
			unique case(number2)
				4'b0000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000001;
				4'b0001:{na,nb,nc,nd,ne,nf,ng} = 7'b1001111;
				4'b0010:{na,nb,nc,nd,ne,nf,ng} = 7'b0010010;
				4'b0011:{na,nb,nc,nd,ne,nf,ng} = 7'b0000110;
				4'b0100:{na,nb,nc,nd,ne,nf,ng} = 7'b1001100;
				4'b0101:{na,nb,nc,nd,ne,nf,ng} = 7'b0100100;
				4'b0110:{na,nb,nc,nd,ne,nf,ng} = 7'b0100000;
				4'b0111:{na,nb,nc,nd,ne,nf,ng} = 7'b0001111;
				4'b1000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000000;
				4'b1001:{na,nb,nc,nd,ne,nf,ng} = 7'b0000100;
			endcase
			
		end
		if(com == 4'b1011)begin
		
			unique case(number3)
				4'b0000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000001;
				4'b0001:{na,nb,nc,nd,ne,nf,ng} = 7'b1001111;
				4'b0010:{na,nb,nc,nd,ne,nf,ng} = 7'b0010010;
				4'b0011:{na,nb,nc,nd,ne,nf,ng} = 7'b0000110;
				4'b0100:{na,nb,nc,nd,ne,nf,ng} = 7'b1001100;
				4'b0101:{na,nb,nc,nd,ne,nf,ng} = 7'b0100100;
				4'b0110:{na,nb,nc,nd,ne,nf,ng} = 7'b0100000;
				4'b0111:{na,nb,nc,nd,ne,nf,ng} = 7'b0001111;
				4'b1000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000000;
				4'b1001:{na,nb,nc,nd,ne,nf,ng} = 7'b0000100;
			endcase
			
		end
		if(com == 4'b1101)begin
		
			unique case(number4)
				4'b0000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000001;
				4'b0001:{na,nb,nc,nd,ne,nf,ng} = 7'b1001111;
				4'b0010:{na,nb,nc,nd,ne,nf,ng} = 7'b0010010;
				4'b0011:{na,nb,nc,nd,ne,nf,ng} = 7'b0000110;
				4'b0100:{na,nb,nc,nd,ne,nf,ng} = 7'b1001100;
				4'b0101:{na,nb,nc,nd,ne,nf,ng} = 7'b0100100;
				4'b0110:{na,nb,nc,nd,ne,nf,ng} = 7'b0100000;
				4'b0111:{na,nb,nc,nd,ne,nf,ng} = 7'b0001111;
				4'b1000:{na,nb,nc,nd,ne,nf,ng} = 7'b0000000;
				4'b1001:{na,nb,nc,nd,ne,nf,ng} = 7'b0000100;
			endcase
			
		end
		
		com = {com[0],com[3:1]};
	
	end
	


endmodule

module divfreq(input CLK,output reg CLK_div,out);

	reg [24:0]Count;
	reg [24:0]sCount;
	
	always@(posedge CLK)begin
	
		if(Count > 25000)begin
			Count <= 25'b0;
			CLK_div = ~CLK_div;
		end
		else begin
			Count <= Count + 1'b1;
		end
	end
	always@(posedge CLK)begin
	
		if(sCount > 25000000)begin
			sCount <= 25'b0;
			out = ~out;
		end
		else begin
			sCount <= sCount + 1'b1;
		end
	end
endmodule
