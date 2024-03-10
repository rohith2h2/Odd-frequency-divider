module oddfrequencydivider(
  input logic clk,
  input logic rstn,
  output clk_div3,
  output clk_div3_50);
  
  reg [3:0] cnt_p;
  reg [3:0] cnt_n;
  reg clk_p, clk_n;
  parameter n = 5;
  
  //initialzing counter
  
  always @(posedge clk or negedge rstn) begin
    if(!rstn)
      cnt_p <= 4'b0000;
    else if(cnt_p == n-1)
      cnt_p <= 4'b0000;
    else
      cnt_p <= cnt_p + 1'b1;
  end
  
  //negative counter initializing
  
  always @(negedge clk or negedge rstn) begin
    if(!rstn)
      cnt_n <= 4'b0000;
    else if(cnt_n == n-1)
      cnt_n <= 4'b0000;
    else
      cnt_n <= cnt_n + 1'b1;
  end
  
  //positiv clock
  always @(posedge clk or negedge rstn) begin
    if(!rstn) 
      clk_p <= 0;
    else if(cnt_p == (n-1)/2)
      clk_p <= ~clk_p;
    else if(cnt_p == 0)
      clk_p <= ~clk_p;
    else
      clk_p <= clk_p;
  end
  
  //negative clk
  always @(posedge clk or negedge rstn) begin
    if(!rstn) 
      clk_n <= 0;
    else if(cnt_n == (n-1)/2)
      clk_n <= ~clk_n;
    else if(cnt_n == 0)
      clk_n <= ~clk_n;
    else
      clk_n <= clk_n;
  end
  
  assign clk_div3 = clk_p;
  assign clk_div3_50 = clk_p || clk_n;
  
endmodule
