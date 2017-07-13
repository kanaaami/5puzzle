module zf(clk, rst_n, zf_in, zf_out);
	input wire clk, rst_n, zf_in;
	output reg zf_out;

	always @(posedge clk) begin
		if (!rst_n) begin
			zf_out <= 0;
		end else begin
			zf_out <= zf_in;
		end
	end

endmodule
