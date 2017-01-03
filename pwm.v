module LED_PWM(clk, PWM_input, LED);

parameter dac_b = 16; // 16536 intensity levels

input clk;
input [dac_b:0] PWM_input;
output LED;

reg [dac_b:0] PWM;
always @(posedge clk) PWM <= PWM[dac_b-1:0]+PWM_input;

assign LED = PWM[dac_b];
endmodule
