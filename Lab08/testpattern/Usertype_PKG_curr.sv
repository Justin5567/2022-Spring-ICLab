//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2022 ICLAB Spring Course
//   Lab08      : PSG
//   Author     : Chih-Wei Peng
//                
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : Usertype_PKG.sv
//   Module Name : usertype
//   Release version : v1.0 (Release Date: Apr-2022)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`ifndef USERTYPE
`define USERTYPE

package usertype;

typedef enum logic  [3:0] { No_action	= 4'd0 ,
                            Buy			= 4'd1 ,
							Sell		= 4'd2 ,
							Deposit		= 4'd4 , 
							Use_item	= 4'd6 ,
							Check 		= 4'd8 ,
							Attack      = 4'd10
							}  Action ;
							
typedef enum logic  [3:0] { No_Err       		= 4'd0 ,
                            Already_Have_PKM	= 4'd1 ,
							Out_of_money		= 4'd2 ,
							Bag_is_full			= 4'd4 , 
							Not_Having_PKM	    = 4'd6 ,
						    Has_Not_Grown	    = 4'd8 ,
							Not_Having_Item		= 4'd10 ,
							HP_is_Zero			= 4'd13
							}  Error_Msg ;

typedef enum logic  [3:0] { No_type			= 4'd0 ,
							Grass		 	= 4'd1 ,
							Fire	     	= 4'd2 ,
                            Water	     	= 4'd4 , 
							Electric     	= 4'd8 ,
							Normal			= 4'd5
							}  PKM_Type ;

typedef enum logic  [3:0] { No_stage		= 4'd0 ,
							Lowest		 	= 4'd1 ,
							Middle	     	= 4'd2 ,
                            Highest	     	= 4'd4  
							}  Stage ;
							
typedef enum logic  [3:0] { No_item			= 4'd0 ,
							Berry	       	= 4'd1 ,
							Medicine      	= 4'd2 ,
							Candy			= 4'd4 ,
                            Bracer	     	= 4'd8 ,
							Water_stone		= 4'd9 ,
							Fire_stone		= 4'd10,
							Thunder_stone	= 4'd12
							}  Item ;
							
typedef enum logic  [1:0] { No_stone		= 2'd0 ,
							W_stone    		= 2'd1 ,
							F_stone     	= 2'd2 ,
							T_stone			= 2'd3 
							}  Stone ;

typedef logic [7:0] Player_id;
typedef logic [3:0] Item_num;
typedef logic [13:0] Money;
typedef logic [15:0] Money_ext;
typedef logic [7:0] HP;
typedef logic [7:0] ATK;
typedef logic [7:0] EXP;

typedef struct packed {
	Item_num	berry_num;
	Item_num	medicine_num;
	Item_num	candy_num;
	Item_num	bracer_num;
	Stone		stone;
	Money		money;
} Bag_Info; 

typedef struct packed {
	Stage		stage;
	PKM_Type	pkm_type;
	HP			hp;
	ATK			atk;
	EXP			exp;
} PKM_Info; 

typedef struct packed {
	Bag_Info	bag_info;
	PKM_Info	pkm_info;
} Player_Info; 

typedef union packed{ 
	Money_ext	d_money;
	Player_id	[1:0]d_id;
    Action		[3:0]d_act;
	PKM_Type	[3:0]d_type;
	Item		[3:0]d_item;
} DATA;

//################################################## Don't revise the code above

//#################################
// Type your user define type here
//#################################

typedef enum logic [3:0]{
	S_IDLE = 4'd0,
	S_ID = 4'd1,
	S_BUY = 4'd2,
	S_SELL = 4'd3,
	S_DEPOSIT = 4'd4,
	S_CHECK = 4'd5,
	S_USE = 4'd6,
	S_ATTACK = 4'd7,
	S_OP = 4'd8,
	S_WR = 4'd9,
	S_WR_ATK = 4'd10
} State_Machine;
/*
typedef enum logic { pkm  = 0,
					 item = 1
					}  PKM_Item ;
*/
//################################################## Don't revise the code below
endpackage
import usertype::*; //import usertype into $unit

`endif

