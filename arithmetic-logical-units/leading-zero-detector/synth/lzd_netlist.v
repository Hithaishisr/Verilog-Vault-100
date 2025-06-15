/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP4
// Date      : Mon Jun 16 01:09:35 2025
/////////////////////////////////////////////////////////////


module lzd ( clk, rst_n, start, data_in, count, all_zero, busy, done );
  input [63:0] data_in;
  output [6:0] count;
  input clk, rst_n, start;
  output all_zero, busy, done;
  wire   \state[0] , n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524;
  wire   [63:0] data_in_reg;
  wire   [6:0] lzd_count;

  FD1 busy_reg ( .D(n299), .CP(clk), .Q(busy), .QN(n515) );
  FD1 \data_in_reg_reg[0]  ( .D(n295), .CP(clk), .Q(data_in_reg[0]) );
  FD1 \data_in_reg_reg[62]  ( .D(n233), .CP(clk), .Q(data_in_reg[62]) );
  FD1 \data_in_reg_reg[63]  ( .D(n298), .CP(clk), .Q(data_in_reg[63]), .QN(
        n516) );
  FD1 \state_reg[1]  ( .D(n296), .CP(clk), .QN(n514) );
  FD1 \state_reg[0]  ( .D(n297), .CP(clk), .Q(\state[0] ) );
  FD1 \data_in_reg_reg[1]  ( .D(n294), .CP(clk), .Q(data_in_reg[1]) );
  FD1 \data_in_reg_reg[2]  ( .D(n293), .CP(clk), .Q(data_in_reg[2]) );
  FD1 \data_in_reg_reg[3]  ( .D(n292), .CP(clk), .Q(data_in_reg[3]) );
  FD1 \data_in_reg_reg[4]  ( .D(n291), .CP(clk), .Q(data_in_reg[4]) );
  FD1 \data_in_reg_reg[5]  ( .D(n290), .CP(clk), .Q(data_in_reg[5]) );
  FD1 \data_in_reg_reg[6]  ( .D(n289), .CP(clk), .Q(data_in_reg[6]) );
  FD1 \data_in_reg_reg[7]  ( .D(n288), .CP(clk), .Q(data_in_reg[7]) );
  FD1 \data_in_reg_reg[8]  ( .D(n287), .CP(clk), .Q(data_in_reg[8]) );
  FD1 \data_in_reg_reg[9]  ( .D(n286), .CP(clk), .Q(data_in_reg[9]) );
  FD1 \data_in_reg_reg[10]  ( .D(n285), .CP(clk), .Q(data_in_reg[10]) );
  FD1 \data_in_reg_reg[11]  ( .D(n284), .CP(clk), .Q(data_in_reg[11]) );
  FD1 \data_in_reg_reg[12]  ( .D(n283), .CP(clk), .Q(data_in_reg[12]) );
  FD1 \data_in_reg_reg[13]  ( .D(n282), .CP(clk), .Q(data_in_reg[13]) );
  FD1 \data_in_reg_reg[14]  ( .D(n281), .CP(clk), .Q(data_in_reg[14]) );
  FD1 \data_in_reg_reg[15]  ( .D(n280), .CP(clk), .Q(data_in_reg[15]) );
  FD1 \data_in_reg_reg[16]  ( .D(n279), .CP(clk), .Q(data_in_reg[16]) );
  FD1 \data_in_reg_reg[17]  ( .D(n278), .CP(clk), .Q(data_in_reg[17]) );
  FD1 \data_in_reg_reg[18]  ( .D(n277), .CP(clk), .Q(data_in_reg[18]) );
  FD1 \data_in_reg_reg[19]  ( .D(n276), .CP(clk), .Q(data_in_reg[19]) );
  FD1 \data_in_reg_reg[20]  ( .D(n275), .CP(clk), .Q(data_in_reg[20]) );
  FD1 \data_in_reg_reg[21]  ( .D(n274), .CP(clk), .Q(data_in_reg[21]) );
  FD1 \data_in_reg_reg[22]  ( .D(n273), .CP(clk), .Q(data_in_reg[22]) );
  FD1 \data_in_reg_reg[23]  ( .D(n272), .CP(clk), .Q(data_in_reg[23]) );
  FD1 \data_in_reg_reg[24]  ( .D(n271), .CP(clk), .Q(data_in_reg[24]) );
  FD1 \data_in_reg_reg[25]  ( .D(n270), .CP(clk), .Q(data_in_reg[25]) );
  FD1 \data_in_reg_reg[26]  ( .D(n269), .CP(clk), .Q(data_in_reg[26]) );
  FD1 \data_in_reg_reg[27]  ( .D(n268), .CP(clk), .Q(data_in_reg[27]) );
  FD1 \data_in_reg_reg[28]  ( .D(n267), .CP(clk), .Q(data_in_reg[28]) );
  FD1 \data_in_reg_reg[29]  ( .D(n266), .CP(clk), .Q(data_in_reg[29]) );
  FD1 \data_in_reg_reg[30]  ( .D(n265), .CP(clk), .Q(data_in_reg[30]) );
  FD1 \data_in_reg_reg[31]  ( .D(n264), .CP(clk), .Q(data_in_reg[31]) );
  FD1 \data_in_reg_reg[32]  ( .D(n263), .CP(clk), .Q(data_in_reg[32]) );
  FD1 \data_in_reg_reg[33]  ( .D(n262), .CP(clk), .Q(data_in_reg[33]) );
  FD1 \data_in_reg_reg[34]  ( .D(n261), .CP(clk), .Q(data_in_reg[34]) );
  FD1 \data_in_reg_reg[35]  ( .D(n260), .CP(clk), .Q(data_in_reg[35]) );
  FD1 \data_in_reg_reg[36]  ( .D(n259), .CP(clk), .Q(data_in_reg[36]) );
  FD1 \data_in_reg_reg[37]  ( .D(n258), .CP(clk), .Q(data_in_reg[37]) );
  FD1 \data_in_reg_reg[38]  ( .D(n257), .CP(clk), .Q(data_in_reg[38]) );
  FD1 \data_in_reg_reg[39]  ( .D(n256), .CP(clk), .Q(data_in_reg[39]) );
  FD1 \data_in_reg_reg[40]  ( .D(n255), .CP(clk), .Q(data_in_reg[40]) );
  FD1 \data_in_reg_reg[41]  ( .D(n254), .CP(clk), .Q(data_in_reg[41]) );
  FD1 \data_in_reg_reg[42]  ( .D(n253), .CP(clk), .Q(data_in_reg[42]) );
  FD1 \data_in_reg_reg[43]  ( .D(n252), .CP(clk), .Q(data_in_reg[43]) );
  FD1 \data_in_reg_reg[44]  ( .D(n251), .CP(clk), .Q(data_in_reg[44]) );
  FD1 \data_in_reg_reg[45]  ( .D(n250), .CP(clk), .Q(data_in_reg[45]) );
  FD1 \data_in_reg_reg[46]  ( .D(n249), .CP(clk), .Q(data_in_reg[46]) );
  FD1 \data_in_reg_reg[47]  ( .D(n248), .CP(clk), .Q(data_in_reg[47]) );
  FD1 \data_in_reg_reg[48]  ( .D(n247), .CP(clk), .Q(data_in_reg[48]) );
  FD1 \data_in_reg_reg[49]  ( .D(n246), .CP(clk), .Q(data_in_reg[49]) );
  FD1 \data_in_reg_reg[50]  ( .D(n245), .CP(clk), .Q(data_in_reg[50]) );
  FD1 \data_in_reg_reg[51]  ( .D(n244), .CP(clk), .Q(data_in_reg[51]) );
  FD1 \data_in_reg_reg[52]  ( .D(n243), .CP(clk), .Q(data_in_reg[52]) );
  FD1 \data_in_reg_reg[53]  ( .D(n242), .CP(clk), .Q(data_in_reg[53]) );
  FD1 \data_in_reg_reg[54]  ( .D(n241), .CP(clk), .Q(data_in_reg[54]) );
  FD1 \data_in_reg_reg[55]  ( .D(n240), .CP(clk), .Q(data_in_reg[55]) );
  FD1 \data_in_reg_reg[56]  ( .D(n239), .CP(clk), .Q(data_in_reg[56]) );
  FD1 \data_in_reg_reg[57]  ( .D(n238), .CP(clk), .Q(data_in_reg[57]) );
  FD1 \data_in_reg_reg[58]  ( .D(n237), .CP(clk), .Q(data_in_reg[58]) );
  FD1 \data_in_reg_reg[59]  ( .D(n236), .CP(clk), .Q(data_in_reg[59]) );
  FD1 \data_in_reg_reg[60]  ( .D(n235), .CP(clk), .Q(data_in_reg[60]) );
  FD1 \data_in_reg_reg[61]  ( .D(n234), .CP(clk), .Q(data_in_reg[61]) );
  FD1 \lzd_count_reg[0]  ( .D(n232), .CP(clk), .Q(lzd_count[0]), .QN(n508) );
  FD1 \lzd_count_reg[1]  ( .D(n231), .CP(clk), .Q(lzd_count[1]), .QN(n510) );
  FD1 \lzd_count_reg[2]  ( .D(n230), .CP(clk), .Q(lzd_count[2]), .QN(n511) );
  FD1 \lzd_count_reg[3]  ( .D(n229), .CP(clk), .QN(n509) );
  FD1 \lzd_count_reg[4]  ( .D(n228), .CP(clk), .Q(lzd_count[4]), .QN(n512) );
  FD1 \lzd_count_reg[5]  ( .D(n227), .CP(clk), .Q(lzd_count[5]), .QN(n523) );
  FD1 \lzd_count_reg[6]  ( .D(n226), .CP(clk), .Q(lzd_count[6]), .QN(n517) );
  FD1 done_reg ( .D(n225), .CP(clk), .Q(done) );
  FD1 all_zero_reg ( .D(n224), .CP(clk), .Q(all_zero) );
  FD1 \count_reg[0]  ( .D(n223), .CP(clk), .Q(count[0]), .QN(n518) );
  FD1 \count_reg[1]  ( .D(n222), .CP(clk), .Q(count[1]), .QN(n519) );
  FD1 \count_reg[2]  ( .D(n221), .CP(clk), .Q(count[2]), .QN(n520) );
  FD1 \count_reg[3]  ( .D(n220), .CP(clk), .Q(count[3]), .QN(n521) );
  FD1 \count_reg[4]  ( .D(n219), .CP(clk), .Q(count[4]), .QN(n522) );
  FD1 \count_reg[5]  ( .D(n218), .CP(clk), .Q(count[5]), .QN(n513) );
  FD1 \count_reg[6]  ( .D(n217), .CP(clk), .Q(count[6]), .QN(n524) );
  ND3 U302 ( .A(\state[0] ), .B(rst_n), .C(n514), .Z(n331) );
  NR2 U303 ( .A(data_in_reg[63]), .B(n331), .Z(n305) );
  ND2 U304 ( .A(start), .B(n515), .Z(n302) );
  ND2 U305 ( .A(rst_n), .B(n302), .Z(n304) );
  NR2 U306 ( .A(n305), .B(n304), .Z(n468) );
  IVP U307 ( .A(n302), .Z(n300) );
  ND2 U308 ( .A(n300), .B(rst_n), .Z(n500) );
  IVP U309 ( .A(n500), .Z(n477) );
  AO2 U310 ( .A(n468), .B(data_in_reg[0]), .C(n477), .D(data_in[0]), .Z(n301)
         );
  IVP U311 ( .A(n301), .Z(n295) );
  OR3 U312 ( .A(\state[0] ), .B(n514), .C(n304), .Z(n506) );
  ND2 U313 ( .A(rst_n), .B(n506), .Z(n505) );
  AO7 U314 ( .A(n505), .B(n515), .C(n500), .Z(n299) );
  ND2 U315 ( .A(n305), .B(n302), .Z(n472) );
  IVP U316 ( .A(n472), .Z(n469) );
  AO2 U317 ( .A(n469), .B(data_in_reg[62]), .C(n477), .D(data_in[63]), .Z(n303) );
  AO7 U318 ( .A(n516), .B(n304), .C(n303), .Z(n298) );
  IVP U319 ( .A(n305), .Z(n327) );
  NR4 U320 ( .A(data_in[62]), .B(data_in[61]), .C(data_in[60]), .D(data_in[59]), .Z(n309) );
  NR4 U321 ( .A(data_in[58]), .B(data_in[57]), .C(data_in[56]), .D(data_in[55]), .Z(n308) );
  NR4 U322 ( .A(data_in[54]), .B(data_in[53]), .C(data_in[52]), .D(data_in[51]), .Z(n307) );
  NR4 U323 ( .A(data_in[50]), .B(data_in[49]), .C(data_in[48]), .D(data_in[47]), .Z(n306) );
  ND4 U324 ( .A(n309), .B(n308), .C(n307), .D(n306), .Z(n325) );
  NR4 U325 ( .A(data_in[46]), .B(data_in[45]), .C(data_in[44]), .D(data_in[43]), .Z(n313) );
  NR4 U326 ( .A(data_in[42]), .B(data_in[41]), .C(data_in[40]), .D(data_in[39]), .Z(n312) );
  NR4 U327 ( .A(data_in[38]), .B(data_in[37]), .C(data_in[36]), .D(data_in[35]), .Z(n311) );
  NR4 U328 ( .A(data_in[34]), .B(data_in[33]), .C(data_in[32]), .D(data_in[31]), .Z(n310) );
  ND4 U329 ( .A(n313), .B(n312), .C(n311), .D(n310), .Z(n324) );
  NR4 U330 ( .A(data_in[30]), .B(data_in[29]), .C(data_in[28]), .D(data_in[27]), .Z(n317) );
  NR4 U331 ( .A(data_in[26]), .B(data_in[25]), .C(data_in[24]), .D(data_in[23]), .Z(n316) );
  NR4 U332 ( .A(data_in[22]), .B(data_in[21]), .C(data_in[20]), .D(data_in[19]), .Z(n315) );
  NR4 U333 ( .A(data_in[18]), .B(data_in[17]), .C(data_in[16]), .D(data_in[15]), .Z(n314) );
  ND4 U334 ( .A(n317), .B(n316), .C(n315), .D(n314), .Z(n323) );
  NR4 U335 ( .A(data_in[14]), .B(data_in[13]), .C(data_in[12]), .D(data_in[11]), .Z(n321) );
  NR4 U336 ( .A(data_in[10]), .B(data_in[9]), .C(data_in[8]), .D(data_in[7]), 
        .Z(n320) );
  NR4 U337 ( .A(data_in[6]), .B(data_in[5]), .C(data_in[4]), .D(data_in[3]), 
        .Z(n319) );
  NR4 U338 ( .A(data_in[2]), .B(data_in[1]), .C(data_in[0]), .D(data_in[63]), 
        .Z(n318) );
  ND4 U339 ( .A(n321), .B(n320), .C(n319), .D(n318), .Z(n322) );
  NR4 U340 ( .A(n325), .B(n324), .C(n323), .D(n322), .Z(n328) );
  ND2 U341 ( .A(n477), .B(n514), .Z(n330) );
  OR3 U342 ( .A(n328), .B(\state[0] ), .C(n330), .Z(n326) );
  ND2 U343 ( .A(n327), .B(n326), .Z(n297) );
  ND2 U344 ( .A(n328), .B(n331), .Z(n329) );
  AO4 U345 ( .A(n516), .B(n331), .C(n330), .D(n329), .Z(n296) );
  AO2 U346 ( .A(n469), .B(data_in_reg[0]), .C(n477), .D(data_in[1]), .Z(n333)
         );
  ND2 U347 ( .A(n468), .B(data_in_reg[1]), .Z(n332) );
  ND2 U348 ( .A(n333), .B(n332), .Z(n294) );
  AO2 U349 ( .A(n469), .B(data_in_reg[1]), .C(n477), .D(data_in[2]), .Z(n335)
         );
  ND2 U350 ( .A(n468), .B(data_in_reg[2]), .Z(n334) );
  ND2 U351 ( .A(n335), .B(n334), .Z(n293) );
  AO2 U352 ( .A(n469), .B(data_in_reg[2]), .C(n477), .D(data_in[3]), .Z(n337)
         );
  ND2 U353 ( .A(n468), .B(data_in_reg[3]), .Z(n336) );
  ND2 U354 ( .A(n337), .B(n336), .Z(n292) );
  AO2 U355 ( .A(n469), .B(data_in_reg[3]), .C(n477), .D(data_in[4]), .Z(n339)
         );
  ND2 U356 ( .A(n468), .B(data_in_reg[4]), .Z(n338) );
  ND2 U357 ( .A(n339), .B(n338), .Z(n291) );
  AO2 U358 ( .A(n469), .B(data_in_reg[4]), .C(n477), .D(data_in[5]), .Z(n341)
         );
  ND2 U359 ( .A(n468), .B(data_in_reg[5]), .Z(n340) );
  ND2 U360 ( .A(n341), .B(n340), .Z(n290) );
  AO2 U361 ( .A(n469), .B(data_in_reg[5]), .C(n477), .D(data_in[6]), .Z(n343)
         );
  ND2 U362 ( .A(n468), .B(data_in_reg[6]), .Z(n342) );
  ND2 U363 ( .A(n343), .B(n342), .Z(n289) );
  AO2 U364 ( .A(n469), .B(data_in_reg[6]), .C(n477), .D(data_in[7]), .Z(n345)
         );
  ND2 U365 ( .A(n468), .B(data_in_reg[7]), .Z(n344) );
  ND2 U366 ( .A(n345), .B(n344), .Z(n288) );
  AO2 U367 ( .A(n469), .B(data_in_reg[7]), .C(n477), .D(data_in[8]), .Z(n347)
         );
  ND2 U368 ( .A(n468), .B(data_in_reg[8]), .Z(n346) );
  ND2 U369 ( .A(n347), .B(n346), .Z(n287) );
  AO2 U370 ( .A(n469), .B(data_in_reg[8]), .C(n477), .D(data_in[9]), .Z(n349)
         );
  ND2 U371 ( .A(n468), .B(data_in_reg[9]), .Z(n348) );
  ND2 U372 ( .A(n349), .B(n348), .Z(n286) );
  AO2 U373 ( .A(n469), .B(data_in_reg[9]), .C(n477), .D(data_in[10]), .Z(n351)
         );
  ND2 U374 ( .A(n468), .B(data_in_reg[10]), .Z(n350) );
  ND2 U375 ( .A(n351), .B(n350), .Z(n285) );
  AO2 U376 ( .A(n469), .B(data_in_reg[10]), .C(n477), .D(data_in[11]), .Z(n353) );
  ND2 U377 ( .A(n468), .B(data_in_reg[11]), .Z(n352) );
  ND2 U378 ( .A(n353), .B(n352), .Z(n284) );
  AO2 U379 ( .A(n469), .B(data_in_reg[11]), .C(n477), .D(data_in[12]), .Z(n355) );
  ND2 U380 ( .A(n468), .B(data_in_reg[12]), .Z(n354) );
  ND2 U381 ( .A(n355), .B(n354), .Z(n283) );
  AO2 U382 ( .A(n469), .B(data_in_reg[12]), .C(n477), .D(data_in[13]), .Z(n357) );
  ND2 U383 ( .A(n468), .B(data_in_reg[13]), .Z(n356) );
  ND2 U384 ( .A(n357), .B(n356), .Z(n282) );
  AO2 U385 ( .A(n469), .B(data_in_reg[13]), .C(n477), .D(data_in[14]), .Z(n359) );
  ND2 U386 ( .A(n468), .B(data_in_reg[14]), .Z(n358) );
  ND2 U387 ( .A(n359), .B(n358), .Z(n281) );
  AO2 U388 ( .A(n469), .B(data_in_reg[14]), .C(n477), .D(data_in[15]), .Z(n361) );
  ND2 U389 ( .A(n468), .B(data_in_reg[15]), .Z(n360) );
  ND2 U390 ( .A(n361), .B(n360), .Z(n280) );
  AO2 U391 ( .A(n469), .B(data_in_reg[15]), .C(n477), .D(data_in[16]), .Z(n363) );
  ND2 U392 ( .A(n468), .B(data_in_reg[16]), .Z(n362) );
  ND2 U393 ( .A(n363), .B(n362), .Z(n279) );
  AO2 U394 ( .A(n469), .B(data_in_reg[16]), .C(n477), .D(data_in[17]), .Z(n365) );
  ND2 U395 ( .A(n468), .B(data_in_reg[17]), .Z(n364) );
  ND2 U396 ( .A(n365), .B(n364), .Z(n278) );
  AO2 U397 ( .A(n469), .B(data_in_reg[17]), .C(n477), .D(data_in[18]), .Z(n367) );
  ND2 U398 ( .A(n468), .B(data_in_reg[18]), .Z(n366) );
  ND2 U399 ( .A(n367), .B(n366), .Z(n277) );
  AO2 U400 ( .A(n469), .B(data_in_reg[18]), .C(n477), .D(data_in[19]), .Z(n369) );
  ND2 U401 ( .A(n468), .B(data_in_reg[19]), .Z(n368) );
  ND2 U402 ( .A(n369), .B(n368), .Z(n276) );
  AO2 U403 ( .A(n469), .B(data_in_reg[19]), .C(n477), .D(data_in[20]), .Z(n371) );
  ND2 U404 ( .A(n468), .B(data_in_reg[20]), .Z(n370) );
  ND2 U405 ( .A(n371), .B(n370), .Z(n275) );
  AO2 U406 ( .A(n469), .B(data_in_reg[20]), .C(n477), .D(data_in[21]), .Z(n373) );
  ND2 U407 ( .A(n468), .B(data_in_reg[21]), .Z(n372) );
  ND2 U408 ( .A(n373), .B(n372), .Z(n274) );
  AO2 U409 ( .A(n469), .B(data_in_reg[21]), .C(n477), .D(data_in[22]), .Z(n375) );
  ND2 U410 ( .A(n468), .B(data_in_reg[22]), .Z(n374) );
  ND2 U411 ( .A(n375), .B(n374), .Z(n273) );
  AO2 U412 ( .A(n469), .B(data_in_reg[22]), .C(n477), .D(data_in[23]), .Z(n377) );
  ND2 U413 ( .A(n468), .B(data_in_reg[23]), .Z(n376) );
  ND2 U414 ( .A(n377), .B(n376), .Z(n272) );
  AO2 U415 ( .A(n469), .B(data_in_reg[23]), .C(n477), .D(data_in[24]), .Z(n379) );
  ND2 U416 ( .A(n468), .B(data_in_reg[24]), .Z(n378) );
  ND2 U417 ( .A(n379), .B(n378), .Z(n271) );
  AO2 U418 ( .A(n469), .B(data_in_reg[24]), .C(n477), .D(data_in[25]), .Z(n381) );
  ND2 U419 ( .A(n468), .B(data_in_reg[25]), .Z(n380) );
  ND2 U420 ( .A(n381), .B(n380), .Z(n270) );
  AO2 U421 ( .A(n469), .B(data_in_reg[25]), .C(n477), .D(data_in[26]), .Z(n383) );
  ND2 U422 ( .A(n468), .B(data_in_reg[26]), .Z(n382) );
  ND2 U423 ( .A(n383), .B(n382), .Z(n269) );
  AO2 U424 ( .A(n469), .B(data_in_reg[26]), .C(n477), .D(data_in[27]), .Z(n385) );
  ND2 U425 ( .A(n468), .B(data_in_reg[27]), .Z(n384) );
  ND2 U426 ( .A(n385), .B(n384), .Z(n268) );
  AO2 U427 ( .A(n469), .B(data_in_reg[27]), .C(n477), .D(data_in[28]), .Z(n387) );
  ND2 U428 ( .A(n468), .B(data_in_reg[28]), .Z(n386) );
  ND2 U429 ( .A(n387), .B(n386), .Z(n267) );
  AO2 U430 ( .A(n469), .B(data_in_reg[28]), .C(n477), .D(data_in[29]), .Z(n389) );
  ND2 U431 ( .A(n468), .B(data_in_reg[29]), .Z(n388) );
  ND2 U432 ( .A(n389), .B(n388), .Z(n266) );
  AO2 U433 ( .A(n469), .B(data_in_reg[29]), .C(n477), .D(data_in[30]), .Z(n391) );
  ND2 U434 ( .A(n468), .B(data_in_reg[30]), .Z(n390) );
  ND2 U435 ( .A(n391), .B(n390), .Z(n265) );
  AO2 U436 ( .A(n469), .B(data_in_reg[30]), .C(n477), .D(data_in[31]), .Z(n393) );
  ND2 U437 ( .A(n468), .B(data_in_reg[31]), .Z(n392) );
  ND2 U438 ( .A(n393), .B(n392), .Z(n264) );
  AO2 U439 ( .A(n469), .B(data_in_reg[31]), .C(n477), .D(data_in[32]), .Z(n395) );
  ND2 U440 ( .A(n468), .B(data_in_reg[32]), .Z(n394) );
  ND2 U441 ( .A(n395), .B(n394), .Z(n263) );
  AO2 U442 ( .A(n469), .B(data_in_reg[32]), .C(n477), .D(data_in[33]), .Z(n397) );
  ND2 U443 ( .A(n468), .B(data_in_reg[33]), .Z(n396) );
  ND2 U444 ( .A(n397), .B(n396), .Z(n262) );
  AO2 U445 ( .A(n469), .B(data_in_reg[33]), .C(n477), .D(data_in[34]), .Z(n399) );
  ND2 U446 ( .A(n468), .B(data_in_reg[34]), .Z(n398) );
  ND2 U447 ( .A(n399), .B(n398), .Z(n261) );
  AO2 U448 ( .A(n469), .B(data_in_reg[34]), .C(n477), .D(data_in[35]), .Z(n401) );
  ND2 U449 ( .A(n468), .B(data_in_reg[35]), .Z(n400) );
  ND2 U450 ( .A(n401), .B(n400), .Z(n260) );
  AO2 U451 ( .A(n469), .B(data_in_reg[35]), .C(n477), .D(data_in[36]), .Z(n403) );
  ND2 U452 ( .A(n468), .B(data_in_reg[36]), .Z(n402) );
  ND2 U453 ( .A(n403), .B(n402), .Z(n259) );
  AO2 U454 ( .A(n469), .B(data_in_reg[36]), .C(n477), .D(data_in[37]), .Z(n405) );
  ND2 U455 ( .A(n468), .B(data_in_reg[37]), .Z(n404) );
  ND2 U456 ( .A(n405), .B(n404), .Z(n258) );
  AO2 U457 ( .A(n469), .B(data_in_reg[37]), .C(n477), .D(data_in[38]), .Z(n407) );
  ND2 U458 ( .A(n468), .B(data_in_reg[38]), .Z(n406) );
  ND2 U459 ( .A(n407), .B(n406), .Z(n257) );
  AO2 U460 ( .A(n469), .B(data_in_reg[38]), .C(n477), .D(data_in[39]), .Z(n409) );
  ND2 U461 ( .A(n468), .B(data_in_reg[39]), .Z(n408) );
  ND2 U462 ( .A(n409), .B(n408), .Z(n256) );
  AO2 U463 ( .A(n469), .B(data_in_reg[39]), .C(n477), .D(data_in[40]), .Z(n411) );
  ND2 U464 ( .A(n468), .B(data_in_reg[40]), .Z(n410) );
  ND2 U465 ( .A(n411), .B(n410), .Z(n255) );
  AO2 U466 ( .A(n469), .B(data_in_reg[40]), .C(n477), .D(data_in[41]), .Z(n413) );
  ND2 U467 ( .A(n468), .B(data_in_reg[41]), .Z(n412) );
  ND2 U468 ( .A(n413), .B(n412), .Z(n254) );
  AO2 U469 ( .A(n469), .B(data_in_reg[41]), .C(n477), .D(data_in[42]), .Z(n415) );
  ND2 U470 ( .A(n468), .B(data_in_reg[42]), .Z(n414) );
  ND2 U471 ( .A(n415), .B(n414), .Z(n253) );
  AO2 U472 ( .A(n469), .B(data_in_reg[42]), .C(n477), .D(data_in[43]), .Z(n417) );
  ND2 U473 ( .A(n468), .B(data_in_reg[43]), .Z(n416) );
  ND2 U474 ( .A(n417), .B(n416), .Z(n252) );
  AO2 U475 ( .A(n469), .B(data_in_reg[43]), .C(n477), .D(data_in[44]), .Z(n419) );
  ND2 U476 ( .A(n468), .B(data_in_reg[44]), .Z(n418) );
  ND2 U477 ( .A(n419), .B(n418), .Z(n251) );
  AO2 U478 ( .A(n469), .B(data_in_reg[44]), .C(n477), .D(data_in[45]), .Z(n421) );
  ND2 U479 ( .A(n468), .B(data_in_reg[45]), .Z(n420) );
  ND2 U480 ( .A(n421), .B(n420), .Z(n250) );
  AO2 U481 ( .A(n469), .B(data_in_reg[45]), .C(n477), .D(data_in[46]), .Z(n423) );
  ND2 U482 ( .A(n468), .B(data_in_reg[46]), .Z(n422) );
  ND2 U483 ( .A(n423), .B(n422), .Z(n249) );
  AO2 U484 ( .A(n469), .B(data_in_reg[46]), .C(n477), .D(data_in[47]), .Z(n425) );
  ND2 U485 ( .A(n468), .B(data_in_reg[47]), .Z(n424) );
  ND2 U486 ( .A(n425), .B(n424), .Z(n248) );
  AO2 U487 ( .A(n469), .B(data_in_reg[47]), .C(n477), .D(data_in[48]), .Z(n427) );
  ND2 U488 ( .A(n468), .B(data_in_reg[48]), .Z(n426) );
  ND2 U489 ( .A(n427), .B(n426), .Z(n247) );
  AO2 U490 ( .A(n469), .B(data_in_reg[48]), .C(n477), .D(data_in[49]), .Z(n429) );
  ND2 U491 ( .A(n468), .B(data_in_reg[49]), .Z(n428) );
  ND2 U492 ( .A(n429), .B(n428), .Z(n246) );
  AO2 U493 ( .A(n469), .B(data_in_reg[49]), .C(n477), .D(data_in[50]), .Z(n431) );
  ND2 U494 ( .A(n468), .B(data_in_reg[50]), .Z(n430) );
  ND2 U495 ( .A(n431), .B(n430), .Z(n245) );
  AO2 U496 ( .A(n469), .B(data_in_reg[50]), .C(n477), .D(data_in[51]), .Z(n433) );
  ND2 U497 ( .A(n468), .B(data_in_reg[51]), .Z(n432) );
  ND2 U498 ( .A(n433), .B(n432), .Z(n244) );
  AO2 U499 ( .A(n469), .B(data_in_reg[51]), .C(n477), .D(data_in[52]), .Z(n435) );
  ND2 U500 ( .A(n468), .B(data_in_reg[52]), .Z(n434) );
  ND2 U501 ( .A(n435), .B(n434), .Z(n243) );
  AO2 U502 ( .A(n469), .B(data_in_reg[52]), .C(n477), .D(data_in[53]), .Z(n437) );
  ND2 U503 ( .A(n468), .B(data_in_reg[53]), .Z(n436) );
  ND2 U504 ( .A(n437), .B(n436), .Z(n242) );
  AO2 U505 ( .A(n469), .B(data_in_reg[53]), .C(n477), .D(data_in[54]), .Z(n439) );
  ND2 U506 ( .A(n468), .B(data_in_reg[54]), .Z(n438) );
  ND2 U507 ( .A(n439), .B(n438), .Z(n241) );
  AO2 U508 ( .A(n469), .B(data_in_reg[54]), .C(n477), .D(data_in[55]), .Z(n441) );
  ND2 U509 ( .A(n468), .B(data_in_reg[55]), .Z(n440) );
  ND2 U510 ( .A(n441), .B(n440), .Z(n240) );
  AO2 U511 ( .A(n469), .B(data_in_reg[55]), .C(n477), .D(data_in[56]), .Z(n443) );
  ND2 U512 ( .A(n468), .B(data_in_reg[56]), .Z(n442) );
  ND2 U513 ( .A(n443), .B(n442), .Z(n239) );
  AO2 U514 ( .A(n469), .B(data_in_reg[56]), .C(n477), .D(data_in[57]), .Z(n445) );
  ND2 U515 ( .A(n468), .B(data_in_reg[57]), .Z(n444) );
  ND2 U516 ( .A(n445), .B(n444), .Z(n238) );
  AO2 U517 ( .A(n469), .B(data_in_reg[57]), .C(n477), .D(data_in[58]), .Z(n447) );
  ND2 U518 ( .A(n468), .B(data_in_reg[58]), .Z(n446) );
  ND2 U519 ( .A(n447), .B(n446), .Z(n237) );
  AO2 U520 ( .A(n469), .B(data_in_reg[58]), .C(n477), .D(data_in[59]), .Z(n449) );
  ND2 U521 ( .A(n468), .B(data_in_reg[59]), .Z(n448) );
  ND2 U522 ( .A(n449), .B(n448), .Z(n236) );
  AO2 U523 ( .A(n469), .B(data_in_reg[59]), .C(n477), .D(data_in[60]), .Z(n451) );
  ND2 U524 ( .A(n468), .B(data_in_reg[60]), .Z(n450) );
  ND2 U525 ( .A(n451), .B(n450), .Z(n235) );
  AO2 U526 ( .A(n469), .B(data_in_reg[60]), .C(n477), .D(data_in[61]), .Z(n453) );
  ND2 U527 ( .A(n468), .B(data_in_reg[61]), .Z(n452) );
  ND2 U528 ( .A(n453), .B(n452), .Z(n234) );
  AO2 U529 ( .A(n469), .B(data_in_reg[61]), .C(n477), .D(data_in[62]), .Z(n455) );
  ND2 U530 ( .A(n468), .B(data_in_reg[62]), .Z(n454) );
  ND2 U531 ( .A(n455), .B(n454), .Z(n233) );
  EO1 U532 ( .A(n472), .B(n508), .C(n508), .D(n468), .Z(n232) );
  NR2 U533 ( .A(lzd_count[0]), .B(n472), .Z(n456) );
  NR2 U534 ( .A(n468), .B(n456), .Z(n459) );
  NR2 U535 ( .A(lzd_count[1]), .B(n472), .Z(n457) );
  EON1 U536 ( .A(n459), .B(n510), .C(n457), .D(lzd_count[0]), .Z(n231) );
  NR2 U537 ( .A(n510), .B(n508), .Z(n461) );
  ND2 U538 ( .A(n469), .B(n461), .Z(n460) );
  NR2 U539 ( .A(n511), .B(n457), .Z(n458) );
  AO2 U540 ( .A(n460), .B(n511), .C(n459), .D(n458), .Z(n230) );
  ND2 U541 ( .A(lzd_count[2]), .B(n461), .Z(n462) );
  AO6 U542 ( .A(n469), .B(n462), .C(n468), .Z(n465) );
  ND2 U543 ( .A(n509), .B(n469), .Z(n463) );
  AO4 U544 ( .A(n465), .B(n509), .C(n463), .D(n462), .Z(n229) );
  NR2 U545 ( .A(n509), .B(n462), .Z(n467) );
  ND2 U546 ( .A(n469), .B(n467), .Z(n466) );
  AN2P U547 ( .A(lzd_count[4]), .B(n463), .Z(n464) );
  AO2 U548 ( .A(n466), .B(n512), .C(n465), .D(n464), .Z(n228) );
  ND2 U549 ( .A(lzd_count[4]), .B(n467), .Z(n470) );
  AO6 U550 ( .A(n469), .B(n470), .C(n468), .Z(n475) );
  NR2 U551 ( .A(n472), .B(n470), .Z(n471) );
  EO1 U552 ( .A(lzd_count[5]), .B(n475), .C(n471), .D(lzd_count[5]), .Z(n227)
         );
  ND2 U553 ( .A(lzd_count[5]), .B(n471), .Z(n476) );
  NR2 U554 ( .A(lzd_count[5]), .B(n472), .Z(n473) );
  NR2 U555 ( .A(n517), .B(n473), .Z(n474) );
  AO2 U556 ( .A(n476), .B(n517), .C(n475), .D(n474), .Z(n226) );
  NR2 U557 ( .A(n477), .B(n505), .Z(n478) );
  ND2 U558 ( .A(n478), .B(done), .Z(n479) );
  ND2 U559 ( .A(n506), .B(n479), .Z(n225) );
  NR4 U560 ( .A(data_in_reg[63]), .B(data_in_reg[61]), .C(data_in_reg[60]), 
        .D(data_in_reg[59]), .Z(n483) );
  NR4 U561 ( .A(data_in_reg[58]), .B(data_in_reg[57]), .C(data_in_reg[56]), 
        .D(data_in_reg[55]), .Z(n482) );
  NR4 U562 ( .A(data_in_reg[54]), .B(data_in_reg[53]), .C(data_in_reg[52]), 
        .D(data_in_reg[51]), .Z(n481) );
  NR4 U563 ( .A(data_in_reg[50]), .B(data_in_reg[49]), .C(data_in_reg[48]), 
        .D(data_in_reg[47]), .Z(n480) );
  ND4 U564 ( .A(n483), .B(n482), .C(n481), .D(n480), .Z(n499) );
  NR4 U565 ( .A(data_in_reg[46]), .B(data_in_reg[45]), .C(data_in_reg[44]), 
        .D(data_in_reg[43]), .Z(n487) );
  NR4 U566 ( .A(data_in_reg[42]), .B(data_in_reg[41]), .C(data_in_reg[40]), 
        .D(data_in_reg[39]), .Z(n486) );
  NR4 U567 ( .A(data_in_reg[38]), .B(data_in_reg[37]), .C(data_in_reg[36]), 
        .D(data_in_reg[35]), .Z(n485) );
  NR4 U568 ( .A(data_in_reg[34]), .B(data_in_reg[33]), .C(data_in_reg[32]), 
        .D(data_in_reg[31]), .Z(n484) );
  ND4 U569 ( .A(n487), .B(n486), .C(n485), .D(n484), .Z(n498) );
  NR4 U570 ( .A(data_in_reg[30]), .B(data_in_reg[29]), .C(data_in_reg[28]), 
        .D(data_in_reg[27]), .Z(n491) );
  NR4 U571 ( .A(data_in_reg[26]), .B(data_in_reg[25]), .C(data_in_reg[24]), 
        .D(data_in_reg[23]), .Z(n490) );
  NR4 U572 ( .A(data_in_reg[22]), .B(data_in_reg[21]), .C(data_in_reg[20]), 
        .D(data_in_reg[19]), .Z(n489) );
  NR4 U573 ( .A(data_in_reg[18]), .B(data_in_reg[17]), .C(data_in_reg[16]), 
        .D(data_in_reg[15]), .Z(n488) );
  ND4 U574 ( .A(n491), .B(n490), .C(n489), .D(n488), .Z(n497) );
  NR4 U575 ( .A(data_in_reg[14]), .B(data_in_reg[13]), .C(data_in_reg[12]), 
        .D(data_in_reg[11]), .Z(n495) );
  NR4 U576 ( .A(data_in_reg[10]), .B(data_in_reg[9]), .C(data_in_reg[8]), .D(
        data_in_reg[7]), .Z(n494) );
  NR4 U577 ( .A(data_in_reg[6]), .B(data_in_reg[5]), .C(data_in_reg[4]), .D(
        data_in_reg[3]), .Z(n493) );
  NR4 U578 ( .A(data_in_reg[2]), .B(data_in_reg[1]), .C(data_in_reg[0]), .D(
        data_in_reg[62]), .Z(n492) );
  ND4 U579 ( .A(n495), .B(n494), .C(n493), .D(n492), .Z(n496) );
  NR4 U580 ( .A(n499), .B(n498), .C(n497), .D(n496), .Z(n504) );
  IVP U581 ( .A(n504), .Z(n502) );
  ND2 U582 ( .A(all_zero), .B(n500), .Z(n501) );
  AO4 U583 ( .A(n502), .B(n506), .C(n505), .D(n501), .Z(n224) );
  OR2P U584 ( .A(n506), .B(n504), .Z(n503) );
  AO4 U585 ( .A(n508), .B(n503), .C(n505), .D(n518), .Z(n223) );
  AO4 U586 ( .A(n510), .B(n503), .C(n505), .D(n519), .Z(n222) );
  AO4 U587 ( .A(n511), .B(n503), .C(n505), .D(n520), .Z(n221) );
  AO4 U588 ( .A(n509), .B(n503), .C(n505), .D(n521), .Z(n220) );
  AO4 U589 ( .A(n512), .B(n503), .C(n505), .D(n522), .Z(n219) );
  AO4 U590 ( .A(n523), .B(n503), .C(n505), .D(n513), .Z(n218) );
  NR2 U591 ( .A(lzd_count[6]), .B(n504), .Z(n507) );
  AO4 U592 ( .A(n507), .B(n506), .C(n505), .D(n524), .Z(n217) );
endmodule

