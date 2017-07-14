module decoder(op, pc_in, pc_we, src0, src1, dst, reg_we, sel1, sel2, data, alu_op, mem_we);
		input wire [31:0] op;
		output reg pc_we, reg_we, mem_we, sel1, sel2;
		output reg [3:0] pc_in, alu_op, src0, src1, dst;
		output reg [39:0] data;

	always @(*) begin
		case (op[31:28])

	0 : begin
		alu_op <= op[31:28];
		dst <= op[27:24];
		src1 <= op[23:20];
		src0 <= 0;
		pc_in <= 0;
		pc_we <= 0;
		reg_we <= 1;
		sel1 <= 0;
		sel2 <= 0;
		data <= 0;
		mem_we <= 0;
	end

	1 : begin
		pc_in <= op[3:0];
		pc_we <= 1;
	end

	default : begin
		pc_we <= 0;
	end

	endcase
end

endmodule
