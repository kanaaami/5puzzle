module imem(pc_out, op);
input wire [3:0] pc_out;
output reg [31:0] op;

	always @(pc_out) begin
case (pc_out)

	0 : begin
	op[31:28] <= 0;
	op[27:24] <= 2;
	op[23:20] <= 1;
	op[19:0] <= 20'b0;
	end

	1 : begin
	op[31:28] <= 1;
	op[27:24] <= 1;
	op[23:20] <= 1;
	op[19:0] <= 20'b0;
	end

	2 : begin
	op[31:28] <= 2;
	op[27:4] <= 24'b0;
	op[3:0] <= 1;
	end

	endcase
	end

	endmodule
