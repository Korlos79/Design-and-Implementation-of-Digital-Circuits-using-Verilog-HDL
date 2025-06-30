module TrafficLightController(
    input clk_50MHz, reset,
    output reg [2:0] LEDR,     // LED đỏ trên DE2
    output reg [2:0] LEDG      // LED xanh, vàng trên DE2
);
    reg [2:0] NS_Light; // Đèn hướng Bắc - Nam (Red, Yellow, Green)
    reg [2:0] EW_Light; // Đèn hướng Đông - Tây (Red, Yellow, Green)
    // State encoding
    parameter S0 = 3'b000; // NS: Green, EW: Red (6s)
    parameter S1 = 3'b001; // NS: Yellow, EW: Red (2s)
    parameter S2 = 3'b010; // NS: Red, EW: Red (2s)
    parameter S3 = 3'b011; // NS: Red, EW: Green (6s)
    parameter S4 = 3'b100; // NS: Red, EW: Yellow (2s)
    parameter S5 = 3'b101; // NS: Red, EW: Red (2s)
    
    reg [2:0] state, next_state;
    reg [25:0] timer;
    
    // Next state logic
    always @(*) begin
        next_state = state; // Default: stay in current state
        
        case (state)
            S0: if (timer > 250_000_000) next_state = S1;
            S1: if (timer > 50_000_000) next_state = S2;
            S2: if (timer > 50_000_000) next_state = S3;
            S3: if (timer > 250_000_000) next_state = S4;
            S4: if (timer > 50_000_000) next_state = S5;
            S5: if (timer > 50_000_000) next_state = S0;
            default: next_state = S0;
        endcase
    end
    
    // State and timer sequential logic
    always @(posedge clk_50MHz or negedge reset) begin
        if (!reset) begin
            timer <= 0;
            state <= S0;
        end else begin
            if (state != next_state) begin
                // Reset timer when state changes
                timer <= 0;
                state <= next_state;
            end else begin
                // Increment timer when staying in the same state
                timer <= timer + 1;
            end
        end
    end
    
    // Light output logic
    always @(*) begin
        case (state)
            S0: begin NS_Light = 3'b001; EW_Light = 3'b100; end
            S1: begin NS_Light = 3'b010; EW_Light = 3'b100; end
            S2: begin NS_Light = 3'b100; EW_Light = 3'b100; end
            S3: begin NS_Light = 3'b100; EW_Light = 3'b001; end
            S4: begin NS_Light = 3'b100; EW_Light = 3'b010; end
            S5: begin NS_Light = 3'b100; EW_Light = 3'b100; end
            default: begin NS_Light = 3'b100; EW_Light = 3'b100; end
        endcase
    end
    
    // LED mapping logic
    always @(*) begin
        LEDR = NS_Light;
		  LEDG = EW_Light;
    end
endmodule