module top(mclk, rst_n, seg, btn);
	input wire mclk, rst_n;
	input wire[4:0] btn;
	output wire[11:0] seg;

	//write enable
	wire pc_we, reg_we, mem_we;

	//pc & imem
	wire [3:0] pc_in, pc_out;
	wire [31:0] op;

	//decoder
	wire [3:0] dst, src0, src1;
	wire [17:0] dec_data;

	//alu
	wire [3:0] alu_op;
	wire [17:0] alu_out;

	//zf
	wire zf, zf_out;

	//selector
	wire sel1, sel2;
	wire [17:0] sel1_out, sel2_out;

	//register
	wire [17:0] reg_data0, reg_data1, cnt, ord;
	wire comp;

	//memory
	wire [17:0] mem_data;

	//divider
	wire clk;





	//sel
	sel s1(.in0(dec_data), .in1(reg_data0), .sel(sel1), .out(sel1_out));
	sel s2(.in0(alu_out), .in1(mem_data), .sel(sel2), .out(sel2_out));

	//register
	register r0(.src0(src0), .src1(src1), .dst(dst), .we(reg_we), .data(sel2_out), .clk(clk), .rst_n(rst_n), .data0(reg_data0), .data1(reg_data1));

	//alu
	alu a0(.in0(sel1_out), .in1(reg_data1), .op(alu_op), .zf(zf), .out(alu_out));

	//memory
	memory mem0(.in(alu_out), .out(mem_data), .addr(reg_data1), .rst_n(rst_n), .clk(clk), .we(mem_we));

	//pc
	pc pc0(.pc_in(pc_in), .pc_out(pc_out), .rst_n(rst_n), .clk(clk), .we(pc_we));

	//imem
	imem imem0(.pc_out(pc_out), .op(op));

	//zf
	zf zf0(.clk(clk), .rst_n(rst_n), .zf_in(zf), .zf_out(zf_out));

	//decoder
	decoder dec1(.op(op), .zf(zf_out), .pc_in(pc_in), .pc_we(pc_we), .src0(src0), .src1(src1), .dst(dst), .reg_we(reg_we), .sel1(sel1), .sel2(sel2), .data(dec_data), .alu_op(alu_op), .mem_we(mem_we));

	//io
	io io0(.seg(seg), .btn(btn), .clk(clk), .rst_n(rst_n));

	//divider
	divider div0(.rst_n(rst_n), .mclk(mclk), .clk(clk));

	endmodule
