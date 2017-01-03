//`include "glow.v"
`include "pwm.v"
//`include "half.v"

module top (
	input  clk,
	output LED0,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
	output LED6,
	output LED7
);


	localparam BITS = 5;
	localparam LOG2DELAY = 20;

	reg [BITS+LOG2DELAY-1:0] counter = 0;
	reg [BITS-1:0] outcnt;

	reg [15:0] led1_i;
	reg [15:0] led2_i;
	reg [15:0] led3_i;
	reg [15:0] led4_i;
	
	always@(posedge clk) begin
		counter <= counter + 1;
		outcnt <= counter >> LOG2DELAY;
	end
	
	
	/*LEDglow #(
        .cnt_b(21)
    ) led(
        .clk(clk),
        .LED(LED0)
    );*/
    
    LED_PWM #() led0(
        .clk(clk),
        .PWM_input(12000),
        .LED(LED0)
    );
    
    LED_PWM #() led1(
        .clk(clk),
        .PWM_input(led1_i),
        .LED(LED1)
    );
    
    LED_PWM #() led2(
        .clk(clk),
        .PWM_input(led2_i),
        .LED(LED2)
    );

    LED_PWM #() led3(
        .clk(clk),
        .PWM_input(led3_i),
        .LED(LED3)
    );
    
    LED_PWM #() led4(
        .clk(clk),
        .PWM_input(led4_i),
        .LED(LED4)
    );
    

    assign led1_i = 1 << outcnt + 0*outcnt/4;
    assign led2_i = 1 << outcnt + 1*outcnt/4;
    assign led3_i = 1 << outctn + 2*outcnt/4;
    assign led4_i = 1 << outctn + 3*outcnt/4;

endmodule
