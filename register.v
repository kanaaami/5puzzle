module register(src0, src1, dst, we, data, clk, rst_n, data0, data1, cnt, ord, comp);
	input wire clk, rst_n, we;
	input wire [3:0] src0, src1, dst;
	input wire [39:0] data;
	output wire [39:0] data0, data1, cnt, ord;
	output wire comp;

	reg [39:0] regis [15:0];

always @(posedge clk) begin
	if (!rst_n) begin

		regis[0] <= 18'b001_010_100_101_011_000;
		regis[1] <= 0;
		regis[2] <= 0;
		regis[3] <= 0;
		regis[4] <= 0;
		regis[5] <= 0;
		regis[6] <= 0;
		regis[7] <= 0;
		regis[8] <= 0;
		regis[9] <= 0;
		regis[10] <= 0;
		regis[11] <= 0;
		regis[12] <= 0;
		regis[13] <= 0;
		regis[14] <= 0;
		regis[15] <= 0;

	end else begin
			if (we) begin
				regis[dst] <= data;
			end else begin
				regis[dst] <= regis[dst];
		end
	end
end


assign data0 = regis[src0];
assign data1 = regis[src1];
assign cnt = regis[1];
assign ord = regis[2];
assign comp = 1;

endmodule
