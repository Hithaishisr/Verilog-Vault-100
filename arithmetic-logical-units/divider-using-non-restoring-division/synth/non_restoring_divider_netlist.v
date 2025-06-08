/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP4
// Date      : Sun Jun  8 11:15:30 2025
/////////////////////////////////////////////////////////////


module non_restoring_divider ( clk, rst, start, dividend, divisor, signed_op, 
        quotient, remainder, done, error, busy );
  input [7:0] dividend;
  input [7:0] divisor;
  output [7:0] quotient;
  output [7:0] remainder;
  input clk, rst, start, signed_op;
  output done, error, busy;
  wire   N21, N22, N23, N79, N104, N270, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737;
  wire   [2:0] state;
  wire   [3:0] N;
  wire   [7:0] divisor_reg;
  wire   [7:0] dividend_reg;
  wire   [7:0] Acc;
  wire   [7:0] shift_acc;
  wire   [7:1] shift_dividend_reg;
  assign N79 = dividend[0];
  assign N104 = divisor[0];

  FD1 done_reg ( .D(n344), .CP(clk), .Q(done) );
  FD1 \divisor_reg_reg[0]  ( .D(n307), .CP(clk), .Q(divisor_reg[0]), .QN(n737)
         );
  FD1 \divisor_reg_reg[1]  ( .D(n306), .CP(clk), .Q(divisor_reg[1]), .QN(n736)
         );
  FD1 \divisor_reg_reg[2]  ( .D(n305), .CP(clk), .Q(divisor_reg[2]), .QN(n735)
         );
  FD1 \divisor_reg_reg[3]  ( .D(n304), .CP(clk), .Q(divisor_reg[3]), .QN(n734)
         );
  FD1 \divisor_reg_reg[4]  ( .D(n303), .CP(clk), .Q(divisor_reg[4]), .QN(n733)
         );
  FD1 \divisor_reg_reg[5]  ( .D(n302), .CP(clk), .Q(divisor_reg[5]), .QN(n732)
         );
  FD1 \divisor_reg_reg[6]  ( .D(n301), .CP(clk), .Q(divisor_reg[6]), .QN(n731)
         );
  FD1 \divisor_reg_reg[7]  ( .D(n300), .CP(clk), .Q(divisor_reg[7]), .QN(n730)
         );
  FD1 \N_reg[0]  ( .D(n325), .CP(clk), .Q(N[0]), .QN(n727) );
  FD1 \N_reg[2]  ( .D(n323), .CP(clk), .Q(N[2]) );
  FD1 busy_reg ( .D(n327), .CP(clk), .Q(busy), .QN(n711) );
  FD1 \state_reg[1]  ( .D(N22), .CP(clk), .Q(state[1]) );
  FD1 \state_reg[0]  ( .D(N21), .CP(clk), .Q(state[0]), .QN(n724) );
  FD1 \state_reg[2]  ( .D(N23), .CP(clk), .Q(state[2]), .QN(n710) );
  FD1 error_reg ( .D(n299), .CP(clk), .Q(error) );
  FD1 \N_reg[1]  ( .D(n324), .CP(clk), .Q(N[1]), .QN(n728) );
  FD1 \N_reg[3]  ( .D(n326), .CP(clk), .QN(n721) );
  FD1 \Acc_reg[0]  ( .D(n298), .CP(clk), .Q(Acc[0]), .QN(n709) );
  FD1 \shift_acc_reg[1]  ( .D(n297), .CP(clk), .Q(shift_acc[1]) );
  FD1 \Acc_reg[7]  ( .D(n296), .CP(clk), .Q(Acc[7]), .QN(n726) );
  FD1 \remainder_reg[0]  ( .D(n335), .CP(clk), .Q(remainder[0]) );
  FD1 \remainder_reg[7]  ( .D(n328), .CP(clk), .Q(remainder[7]), .QN(n729) );
  FD1 \Acc_reg[6]  ( .D(n295), .CP(clk), .Q(Acc[6]), .QN(n715) );
  FD1 \remainder_reg[6]  ( .D(n329), .CP(clk), .Q(remainder[6]) );
  FD1 \shift_acc_reg[7]  ( .D(n294), .CP(clk), .Q(shift_acc[7]) );
  FD1 \Acc_reg[5]  ( .D(n293), .CP(clk), .Q(Acc[5]), .QN(n716) );
  FD1 \remainder_reg[5]  ( .D(n330), .CP(clk), .Q(remainder[5]) );
  FD1 \shift_acc_reg[6]  ( .D(n292), .CP(clk), .Q(shift_acc[6]) );
  FD1 \Acc_reg[4]  ( .D(n291), .CP(clk), .Q(Acc[4]), .QN(n717) );
  FD1 \remainder_reg[4]  ( .D(n331), .CP(clk), .Q(remainder[4]) );
  FD1 \shift_acc_reg[5]  ( .D(n290), .CP(clk), .Q(shift_acc[5]) );
  FD1 \Acc_reg[3]  ( .D(n289), .CP(clk), .Q(Acc[3]), .QN(n718) );
  FD1 \remainder_reg[3]  ( .D(n332), .CP(clk), .Q(remainder[3]) );
  FD1 \shift_acc_reg[4]  ( .D(n288), .CP(clk), .Q(shift_acc[4]) );
  FD1 \Acc_reg[2]  ( .D(n287), .CP(clk), .Q(Acc[2]), .QN(n719) );
  FD1 \remainder_reg[2]  ( .D(n333), .CP(clk), .Q(remainder[2]) );
  FD1 \shift_acc_reg[3]  ( .D(n286), .CP(clk), .Q(shift_acc[3]) );
  FD1 \Acc_reg[1]  ( .D(n285), .CP(clk), .Q(Acc[1]), .QN(n720) );
  FD1 \remainder_reg[1]  ( .D(n334), .CP(clk), .Q(remainder[1]) );
  FD1 \shift_acc_reg[2]  ( .D(n284), .CP(clk), .Q(shift_acc[2]) );
  FD1 \dividend_reg_reg[0]  ( .D(n345), .CP(clk), .Q(N270), .QN(n712) );
  FD1 \quotient_reg[0]  ( .D(n343), .CP(clk), .Q(quotient[0]) );
  FD1 \shift_dividend_reg_reg[1]  ( .D(n322), .CP(clk), .Q(
        shift_dividend_reg[1]) );
  FD1 \dividend_reg_reg[1]  ( .D(n309), .CP(clk), .Q(dividend_reg[1]), .QN(
        n714) );
  FD1 \quotient_reg[1]  ( .D(n342), .CP(clk), .Q(quotient[1]) );
  FD1 \shift_dividend_reg_reg[2]  ( .D(n308), .CP(clk), .Q(
        shift_dividend_reg[2]) );
  FD1 \dividend_reg_reg[2]  ( .D(n311), .CP(clk), .Q(dividend_reg[2]), .QN(
        n723) );
  FD1 \quotient_reg[2]  ( .D(n341), .CP(clk), .Q(quotient[2]) );
  FD1 \shift_dividend_reg_reg[3]  ( .D(n310), .CP(clk), .Q(
        shift_dividend_reg[3]) );
  FD1 \dividend_reg_reg[3]  ( .D(n313), .CP(clk), .Q(dividend_reg[3]) );
  FD1 \quotient_reg[3]  ( .D(n340), .CP(clk), .Q(quotient[3]) );
  FD1 \shift_dividend_reg_reg[4]  ( .D(n312), .CP(clk), .Q(
        shift_dividend_reg[4]) );
  FD1 \dividend_reg_reg[4]  ( .D(n315), .CP(clk), .Q(dividend_reg[4]), .QN(
        n708) );
  FD1 \quotient_reg[4]  ( .D(n339), .CP(clk), .Q(quotient[4]) );
  FD1 \shift_dividend_reg_reg[5]  ( .D(n314), .CP(clk), .Q(
        shift_dividend_reg[5]) );
  FD1 \dividend_reg_reg[5]  ( .D(n317), .CP(clk), .Q(dividend_reg[5]), .QN(
        n713) );
  FD1 \quotient_reg[5]  ( .D(n338), .CP(clk), .Q(quotient[5]) );
  FD1 \shift_dividend_reg_reg[6]  ( .D(n316), .CP(clk), .Q(
        shift_dividend_reg[6]) );
  FD1 \dividend_reg_reg[6]  ( .D(n319), .CP(clk), .Q(dividend_reg[6]), .QN(
        n722) );
  FD1 \quotient_reg[6]  ( .D(n337), .CP(clk), .Q(quotient[6]) );
  FD1 \shift_dividend_reg_reg[7]  ( .D(n318), .CP(clk), .Q(
        shift_dividend_reg[7]) );
  FD1 \dividend_reg_reg[7]  ( .D(n321), .CP(clk), .Q(dividend_reg[7]), .QN(
        n725) );
  FD1 \quotient_reg[7]  ( .D(n336), .CP(clk), .Q(quotient[7]) );
  FD1 \shift_acc_reg[0]  ( .D(n320), .CP(clk), .Q(shift_acc[0]) );
  IVP U350 ( .A(n631), .Z(n632) );
  IVP U351 ( .A(n619), .Z(n620) );
  IVP U352 ( .A(n609), .Z(n610) );
  IVP U353 ( .A(n599), .Z(n600) );
  IVP U354 ( .A(n589), .Z(n590) );
  IVP U355 ( .A(n579), .Z(n580) );
  IVP U356 ( .A(n569), .Z(n570) );
  AO6 U357 ( .A(n459), .B(n627), .C(n458), .Z(n463) );
  ND2 U358 ( .A(n350), .B(Acc[7]), .Z(n431) );
  IVP U359 ( .A(dividend[7]), .Z(n350) );
  NR2 U360 ( .A(rst), .B(n711), .Z(n642) );
  NR3 U361 ( .A(N[1]), .B(N[2]), .C(N[0]), .Z(n650) );
  ND2 U362 ( .A(n650), .B(n721), .Z(n429) );
  ND4 U363 ( .A(n642), .B(state[1]), .C(n710), .D(n429), .Z(n417) );
  NR2 U364 ( .A(state[0]), .B(n417), .Z(n695) );
  IVP U365 ( .A(n695), .Z(n502) );
  ND2 U366 ( .A(shift_acc[0]), .B(n502), .Z(n351) );
  AO7 U367 ( .A(n502), .B(n725), .C(n351), .Z(n320) );
  IVP U368 ( .A(divisor[1]), .Z(n367) );
  IVP U369 ( .A(N104), .Z(n368) );
  ND2 U370 ( .A(n367), .B(n368), .Z(n372) );
  NR2 U371 ( .A(divisor[2]), .B(n372), .Z(n378) );
  IVP U372 ( .A(divisor[3]), .Z(n377) );
  ND2 U373 ( .A(n378), .B(n377), .Z(n381) );
  NR2 U374 ( .A(divisor[4]), .B(n381), .Z(n387) );
  IVP U375 ( .A(divisor[5]), .Z(n386) );
  ND2 U376 ( .A(n387), .B(n386), .Z(n392) );
  NR2 U377 ( .A(divisor[6]), .B(n392), .Z(n400) );
  IVP U378 ( .A(divisor[7]), .Z(n352) );
  ND2 U379 ( .A(n400), .B(n352), .Z(n460) );
  NR2 U380 ( .A(dividend[7]), .B(n352), .Z(n529) );
  IVP U381 ( .A(divisor[6]), .Z(n361) );
  IVP U382 ( .A(dividend[1]), .Z(n689) );
  AO6 U383 ( .A(dividend[1]), .B(n367), .C(N79), .Z(n353) );
  AO2 U384 ( .A(divisor[1]), .B(n689), .C(N104), .D(n353), .Z(n355) );
  IVP U385 ( .A(divisor[2]), .Z(n354) );
  AO5 U386 ( .A(dividend[2]), .B(n355), .C(n354), .Z(n356) );
  IVP U387 ( .A(dividend[3]), .Z(n672) );
  AO5 U388 ( .A(divisor[3]), .B(n356), .C(n672), .Z(n358) );
  IVP U389 ( .A(divisor[4]), .Z(n357) );
  AO5 U390 ( .A(dividend[4]), .B(n358), .C(n357), .Z(n359) );
  IVP U391 ( .A(dividend[5]), .Z(n662) );
  AO5 U392 ( .A(divisor[5]), .B(n359), .C(n662), .Z(n360) );
  AO5 U393 ( .A(dividend[6]), .B(n361), .C(n360), .Z(n362) );
  AO4 U394 ( .A(n529), .B(n362), .C(divisor[7]), .D(n350), .Z(n363) );
  ND2 U395 ( .A(n460), .B(n363), .Z(n364) );
  NR2 U396 ( .A(signed_op), .B(n364), .Z(n696) );
  ND2 U397 ( .A(signed_op), .B(n460), .Z(n403) );
  IVP U398 ( .A(n403), .Z(n399) );
  ND2 U399 ( .A(start), .B(n711), .Z(n510) );
  NR3 U400 ( .A(rst), .B(done), .C(n510), .Z(n705) );
  AO3 U401 ( .A(n696), .B(n399), .C(N104), .D(n705), .Z(n366) );
  IVP U402 ( .A(rst), .Z(n697) );
  ND2 U403 ( .A(n364), .B(n403), .Z(n701) );
  ND2 U404 ( .A(n705), .B(n701), .Z(n522) );
  ND2 U405 ( .A(n697), .B(n522), .Z(n521) );
  IVP U406 ( .A(n521), .Z(n395) );
  ND2 U407 ( .A(divisor_reg[0]), .B(n395), .Z(n365) );
  ND2 U408 ( .A(n366), .B(n365), .Z(n307) );
  IVP U409 ( .A(signed_op), .Z(n504) );
  ND2 U410 ( .A(n705), .B(divisor[7]), .Z(n401) );
  NR2 U411 ( .A(n504), .B(n401), .Z(n390) );
  AO3 U412 ( .A(n368), .B(n367), .C(n390), .D(n372), .Z(n371) );
  IVP U413 ( .A(n705), .Z(n698) );
  NR2 U414 ( .A(n698), .B(n403), .Z(n658) );
  IVP U415 ( .A(n658), .Z(n369) );
  ND2 U416 ( .A(n705), .B(n696), .Z(n679) );
  AO7 U417 ( .A(divisor[7]), .B(n369), .C(n679), .Z(n394) );
  ND2 U418 ( .A(n394), .B(divisor[1]), .Z(n370) );
  AO3 U419 ( .A(n521), .B(n736), .C(n371), .D(n370), .Z(n306) );
  ND2 U420 ( .A(n390), .B(n372), .Z(n376) );
  IVP U421 ( .A(n390), .Z(n391) );
  NR2 U422 ( .A(n372), .B(n391), .Z(n373) );
  AO7 U423 ( .A(n373), .B(n394), .C(divisor[2]), .Z(n375) );
  ND2 U424 ( .A(divisor_reg[2]), .B(n395), .Z(n374) );
  AO3 U425 ( .A(divisor[2]), .B(n376), .C(n375), .D(n374), .Z(n305) );
  AO3 U426 ( .A(n378), .B(n377), .C(n390), .D(n381), .Z(n380) );
  ND2 U427 ( .A(n394), .B(divisor[3]), .Z(n379) );
  AO3 U428 ( .A(n521), .B(n734), .C(n380), .D(n379), .Z(n304) );
  ND2 U429 ( .A(n390), .B(n381), .Z(n385) );
  NR2 U430 ( .A(n381), .B(n391), .Z(n382) );
  AO7 U431 ( .A(n394), .B(n382), .C(divisor[4]), .Z(n384) );
  ND2 U432 ( .A(divisor_reg[4]), .B(n395), .Z(n383) );
  AO3 U433 ( .A(divisor[4]), .B(n385), .C(n384), .D(n383), .Z(n303) );
  AO3 U434 ( .A(n387), .B(n386), .C(n390), .D(n392), .Z(n389) );
  ND2 U435 ( .A(n394), .B(divisor[5]), .Z(n388) );
  AO3 U436 ( .A(n521), .B(n732), .C(n389), .D(n388), .Z(n302) );
  ND2 U437 ( .A(n390), .B(n392), .Z(n398) );
  NR2 U438 ( .A(n392), .B(n391), .Z(n393) );
  AO7 U439 ( .A(n394), .B(n393), .C(divisor[6]), .Z(n397) );
  ND2 U440 ( .A(divisor_reg[6]), .B(n395), .Z(n396) );
  AO3 U441 ( .A(divisor[6]), .B(n398), .C(n397), .D(n396), .Z(n301) );
  AO6 U442 ( .A(n400), .B(n399), .C(n696), .Z(n402) );
  AO4 U443 ( .A(n402), .B(n401), .C(n521), .D(n730), .Z(n300) );
  NR4 U444 ( .A(state[2]), .B(state[1]), .C(n403), .D(n724), .Z(n700) );
  AO4 U445 ( .A(n708), .B(divisor_reg[4]), .C(n713), .D(divisor_reg[5]), .Z(
        n404) );
  IVP U446 ( .A(n404), .Z(n413) );
  NR2 U447 ( .A(divisor_reg[1]), .B(n714), .Z(n405) );
  NR2 U448 ( .A(N270), .B(n405), .Z(n406) );
  AO2 U449 ( .A(divisor_reg[1]), .B(n714), .C(divisor_reg[0]), .D(n406), .Z(
        n407) );
  AO5 U450 ( .A(dividend_reg[2]), .B(n407), .C(n735), .Z(n408) );
  NR2 U451 ( .A(divisor_reg[3]), .B(n408), .Z(n411) );
  ND2 U452 ( .A(divisor_reg[3]), .B(n408), .Z(n410) );
  ND2 U453 ( .A(divisor_reg[4]), .B(n708), .Z(n409) );
  AO3 U454 ( .A(dividend_reg[3]), .B(n411), .C(n410), .D(n409), .Z(n412) );
  AO2 U455 ( .A(n413), .B(n412), .C(divisor_reg[5]), .D(n713), .Z(n414) );
  AO5 U456 ( .A(dividend_reg[6]), .B(n731), .C(n414), .Z(n415) );
  AO5 U457 ( .A(divisor_reg[7]), .B(n725), .C(n415), .Z(n703) );
  ND2 U458 ( .A(n700), .B(n703), .Z(n416) );
  AO3 U459 ( .A(n698), .B(n416), .C(n697), .D(n679), .Z(n640) );
  NR2 U460 ( .A(n724), .B(n417), .Z(n418) );
  NR2 U461 ( .A(n640), .B(n418), .Z(n498) );
  ND2 U462 ( .A(n642), .B(n429), .Z(n644) );
  NR2 U463 ( .A(n498), .B(n644), .Z(n497) );
  EO U464 ( .A(n726), .B(divisor_reg[0]), .Z(n423) );
  AO2 U465 ( .A(Acc[0]), .B(n498), .C(n497), .D(n419), .Z(n420) );
  IVP U466 ( .A(n420), .Z(n298) );
  ND2 U467 ( .A(shift_acc[1]), .B(n502), .Z(n422) );
  ND2 U468 ( .A(Acc[0]), .B(n695), .Z(n421) );
  ND2 U469 ( .A(n422), .B(n421), .Z(n297) );
  EO U470 ( .A(n726), .B(divisor_reg[6]), .Z(n465) );
  EO U471 ( .A(n726), .B(divisor_reg[5]), .Z(n471) );
  EO U472 ( .A(n726), .B(divisor_reg[4]), .Z(n477) );
  EO U473 ( .A(n726), .B(divisor_reg[3]), .Z(n483) );
  EO U474 ( .A(n726), .B(divisor_reg[2]), .Z(n489) );
  EO U475 ( .A(n726), .B(divisor_reg[1]), .Z(n495) );
  FA1A U476 ( .A(shift_acc[0]), .B(n726), .CI(n423), .CO(n494), .S(n419) );
  EO U477 ( .A(n726), .B(divisor_reg[7]), .Z(n424) );
  EO U478 ( .A(n424), .B(shift_acc[7]), .Z(n425) );
  EO U479 ( .A(n426), .B(n425), .Z(n427) );
  AO2 U480 ( .A(n497), .B(n427), .C(n498), .D(Acc[7]), .Z(n428) );
  IVP U481 ( .A(n428), .Z(n296) );
  NR2 U482 ( .A(n711), .B(n429), .Z(n514) );
  ND2 U483 ( .A(n697), .B(n514), .Z(n538) );
  EO U484 ( .A(n430), .B(n726), .Z(n459) );
  ND2 U485 ( .A(signed_op), .B(n726), .Z(n565) );
  NR2 U486 ( .A(n350), .B(n565), .Z(n627) );
  ND2 U487 ( .A(signed_op), .B(n431), .Z(n451) );
  HA1 U488 ( .A(n432), .B(n715), .CO(n430), .S(n626) );
  AN3 U489 ( .A(signed_op), .B(Acc[7]), .C(dividend[7]), .Z(n567) );
  AO2 U490 ( .A(n451), .B(Acc[6]), .C(n626), .D(n567), .Z(n433) );
  IVP U491 ( .A(n433), .Z(n630) );
  NR2 U492 ( .A(n726), .B(n731), .Z(n434) );
  EO U493 ( .A(n434), .B(n567), .Z(n629) );
  HA1 U494 ( .A(n435), .B(n716), .CO(n432), .S(n615) );
  AO2 U495 ( .A(n451), .B(Acc[5]), .C(n615), .D(n567), .Z(n436) );
  IVP U496 ( .A(n436), .Z(n618) );
  NR2 U497 ( .A(n726), .B(n732), .Z(n437) );
  EO U498 ( .A(n437), .B(n567), .Z(n617) );
  HA1 U499 ( .A(n438), .B(n717), .CO(n435), .S(n605) );
  AO2 U500 ( .A(n451), .B(Acc[4]), .C(n605), .D(n567), .Z(n439) );
  IVP U501 ( .A(n439), .Z(n608) );
  NR2 U502 ( .A(n726), .B(n733), .Z(n440) );
  EO U503 ( .A(n440), .B(n567), .Z(n607) );
  HA1 U504 ( .A(n441), .B(n718), .CO(n438), .S(n595) );
  AO2 U505 ( .A(n451), .B(Acc[3]), .C(n595), .D(n567), .Z(n442) );
  IVP U506 ( .A(n442), .Z(n598) );
  NR2 U507 ( .A(n726), .B(n734), .Z(n443) );
  EO U508 ( .A(n443), .B(n567), .Z(n597) );
  HA1 U509 ( .A(n444), .B(n719), .CO(n441), .S(n585) );
  AO2 U510 ( .A(n451), .B(Acc[2]), .C(n585), .D(n567), .Z(n445) );
  IVP U511 ( .A(n445), .Z(n588) );
  NR2 U512 ( .A(n726), .B(n735), .Z(n446) );
  EO U513 ( .A(n446), .B(n567), .Z(n587) );
  NR2 U514 ( .A(n726), .B(n736), .Z(n447) );
  EO U515 ( .A(n447), .B(n567), .Z(n578) );
  HA1 U516 ( .A(n709), .B(n720), .CO(n444), .S(n575) );
  AO2 U517 ( .A(n451), .B(Acc[1]), .C(n575), .D(n567), .Z(n448) );
  IVP U518 ( .A(n448), .Z(n577) );
  AO7 U519 ( .A(n567), .B(n451), .C(Acc[0]), .Z(n449) );
  IVP U520 ( .A(n449), .Z(n568) );
  NR2 U521 ( .A(n726), .B(n737), .Z(n450) );
  EO U522 ( .A(n450), .B(n567), .Z(n566) );
  AO2 U523 ( .A(n451), .B(Acc[7]), .C(n459), .D(n567), .Z(n452) );
  IVP U524 ( .A(n452), .Z(n455) );
  NR2 U525 ( .A(n726), .B(n730), .Z(n453) );
  EO U526 ( .A(n453), .B(n567), .Z(n454) );
  EO U527 ( .A(n455), .B(n454), .Z(n456) );
  EO U528 ( .A(n457), .B(n456), .Z(n458) );
  IVP U529 ( .A(n538), .Z(n638) );
  NR2 U530 ( .A(n460), .B(n698), .Z(n461) );
  NR2 U531 ( .A(n638), .B(n461), .Z(n527) );
  AN2P U532 ( .A(n697), .B(n527), .Z(n635) );
  IVP U533 ( .A(n635), .Z(n462) );
  AO4 U534 ( .A(n538), .B(n463), .C(n729), .D(n462), .Z(n328) );
  FA1A U535 ( .A(n465), .B(shift_acc[6]), .CI(n464), .CO(n426), .S(n466) );
  AO2 U536 ( .A(Acc[6]), .B(n498), .C(n497), .D(n466), .Z(n467) );
  IVP U537 ( .A(n467), .Z(n295) );
  ND2 U538 ( .A(Acc[6]), .B(n695), .Z(n469) );
  ND2 U539 ( .A(shift_acc[7]), .B(n502), .Z(n468) );
  ND2 U540 ( .A(n469), .B(n468), .Z(n294) );
  FA1A U541 ( .A(n471), .B(shift_acc[5]), .CI(n470), .CO(n464), .S(n472) );
  AO2 U542 ( .A(Acc[5]), .B(n498), .C(n497), .D(n472), .Z(n473) );
  IVP U543 ( .A(n473), .Z(n293) );
  ND2 U544 ( .A(shift_acc[6]), .B(n502), .Z(n475) );
  ND2 U545 ( .A(Acc[5]), .B(n695), .Z(n474) );
  ND2 U546 ( .A(n475), .B(n474), .Z(n292) );
  FA1A U547 ( .A(n477), .B(shift_acc[4]), .CI(n476), .CO(n470), .S(n478) );
  AO2 U548 ( .A(Acc[4]), .B(n498), .C(n497), .D(n478), .Z(n479) );
  IVP U549 ( .A(n479), .Z(n291) );
  ND2 U550 ( .A(shift_acc[5]), .B(n502), .Z(n481) );
  ND2 U551 ( .A(Acc[4]), .B(n695), .Z(n480) );
  ND2 U552 ( .A(n481), .B(n480), .Z(n290) );
  FA1A U553 ( .A(n483), .B(shift_acc[3]), .CI(n482), .CO(n476), .S(n484) );
  AO2 U554 ( .A(Acc[3]), .B(n498), .C(n497), .D(n484), .Z(n485) );
  IVP U555 ( .A(n485), .Z(n289) );
  ND2 U556 ( .A(shift_acc[4]), .B(n502), .Z(n487) );
  ND2 U557 ( .A(Acc[3]), .B(n695), .Z(n486) );
  ND2 U558 ( .A(n487), .B(n486), .Z(n288) );
  FA1A U559 ( .A(n489), .B(shift_acc[2]), .CI(n488), .CO(n482), .S(n490) );
  AO2 U560 ( .A(Acc[2]), .B(n498), .C(n497), .D(n490), .Z(n491) );
  IVP U561 ( .A(n491), .Z(n287) );
  ND2 U562 ( .A(shift_acc[3]), .B(n502), .Z(n493) );
  ND2 U563 ( .A(Acc[2]), .B(n695), .Z(n492) );
  ND2 U564 ( .A(n493), .B(n492), .Z(n286) );
  FA1A U565 ( .A(n495), .B(shift_acc[1]), .CI(n494), .CO(n488), .S(n496) );
  AO2 U566 ( .A(Acc[1]), .B(n498), .C(n497), .D(n496), .Z(n499) );
  IVP U567 ( .A(n499), .Z(n285) );
  ND2 U568 ( .A(shift_acc[2]), .B(n502), .Z(n501) );
  ND2 U569 ( .A(Acc[1]), .B(n695), .Z(n500) );
  ND2 U570 ( .A(n501), .B(n500), .Z(n284) );
  AO4 U571 ( .A(n502), .B(dividend_reg[3]), .C(shift_dividend_reg[4]), .D(n695), .Z(n503) );
  IVP U572 ( .A(n503), .Z(n312) );
  NR2 U573 ( .A(n510), .B(n504), .Z(n505) );
  AO3 U574 ( .A(state[1]), .B(n505), .C(n697), .D(n710), .Z(n509) );
  IVP U575 ( .A(n514), .Z(n511) );
  AO1P U576 ( .A(n710), .B(n511), .C(rst), .D(state[1]), .Z(n506) );
  ND2 U577 ( .A(n506), .B(state[0]), .Z(n508) );
  EO1 U578 ( .A(state[2]), .B(state[1]), .C(state[1]), .D(state[2]), .Z(n517)
         );
  ND2 U579 ( .A(n638), .B(n517), .Z(n507) );
  AO3 U580 ( .A(state[0]), .B(n509), .C(n508), .D(n507), .Z(N21) );
  NR2 U581 ( .A(signed_op), .B(n510), .Z(n513) );
  NR2 U582 ( .A(state[2]), .B(state[1]), .Z(n512) );
  AO3 U583 ( .A(state[0]), .B(n513), .C(n512), .D(n511), .Z(n516) );
  NR2 U584 ( .A(state[0]), .B(n514), .Z(n520) );
  ND2 U585 ( .A(n520), .B(n517), .Z(n515) );
  AO6 U586 ( .A(n516), .B(n515), .C(rst), .Z(N22) );
  NR2 U587 ( .A(state[2]), .B(n538), .Z(n518) );
  AO2 U588 ( .A(n518), .B(state[0]), .C(n517), .D(n697), .Z(n519) );
  NR2 U589 ( .A(n520), .B(n519), .Z(N23) );
  NR4 U590 ( .A(state[0]), .B(state[1]), .C(n710), .D(n644), .Z(n686) );
  NR2 U591 ( .A(n686), .B(n521), .Z(n687) );
  AO2 U592 ( .A(N270), .B(n687), .C(n686), .D(n726), .Z(n525) );
  IVP U593 ( .A(n522), .Z(n523) );
  ND2 U594 ( .A(N79), .B(n523), .Z(n524) );
  ND2 U595 ( .A(n525), .B(n524), .Z(n345) );
  ND2 U596 ( .A(done), .B(n635), .Z(n526) );
  ND2 U597 ( .A(n527), .B(n526), .Z(n344) );
  EON1 U598 ( .A(n712), .B(n538), .C(n635), .D(quotient[0]), .Z(n343) );
  NR2 U599 ( .A(divisor[7]), .B(n350), .Z(n528) );
  AO7 U600 ( .A(n529), .B(n528), .C(signed_op), .Z(n559) );
  NR2 U601 ( .A(n712), .B(n559), .Z(n531) );
  ND2 U602 ( .A(n531), .B(dividend_reg[1]), .Z(n530) );
  AO3 U603 ( .A(n531), .B(dividend_reg[1]), .C(n638), .D(n530), .Z(n533) );
  ND2 U604 ( .A(n635), .B(quotient[1]), .Z(n532) );
  ND2 U605 ( .A(n533), .B(n532), .Z(n342) );
  NR2 U606 ( .A(dividend_reg[1]), .B(N270), .Z(n539) );
  NR2 U607 ( .A(n559), .B(n539), .Z(n535) );
  ND2 U608 ( .A(dividend_reg[2]), .B(n535), .Z(n534) );
  AO3 U609 ( .A(dividend_reg[2]), .B(n535), .C(n638), .D(n534), .Z(n537) );
  ND2 U610 ( .A(n635), .B(quotient[2]), .Z(n536) );
  ND2 U611 ( .A(n537), .B(n536), .Z(n341) );
  NR2 U612 ( .A(n538), .B(n559), .Z(n549) );
  ND2 U613 ( .A(n539), .B(n723), .Z(n544) );
  ND2 U614 ( .A(n549), .B(n544), .Z(n543) );
  ND2 U615 ( .A(n635), .B(quotient[3]), .Z(n542) );
  IVP U616 ( .A(n544), .Z(n540) );
  AO3 U617 ( .A(n540), .B(n559), .C(n638), .D(dividend_reg[3]), .Z(n541) );
  AO3 U618 ( .A(dividend_reg[3]), .B(n543), .C(n542), .D(n541), .Z(n340) );
  ND2 U619 ( .A(n638), .B(n559), .Z(n548) );
  ND2 U620 ( .A(n635), .B(quotient[4]), .Z(n547) );
  NR2 U621 ( .A(dividend_reg[3]), .B(n544), .Z(n545) );
  ND2 U622 ( .A(n545), .B(n708), .Z(n554) );
  AO3 U623 ( .A(n545), .B(n708), .C(n549), .D(n554), .Z(n546) );
  AO3 U624 ( .A(n548), .B(n708), .C(n547), .D(n546), .Z(n339) );
  ND2 U625 ( .A(n549), .B(n554), .Z(n553) );
  ND2 U626 ( .A(n635), .B(quotient[5]), .Z(n552) );
  IVP U627 ( .A(n554), .Z(n550) );
  AO3 U628 ( .A(n550), .B(n559), .C(n638), .D(dividend_reg[5]), .Z(n551) );
  AO3 U629 ( .A(dividend_reg[5]), .B(n553), .C(n552), .D(n551), .Z(n338) );
  NR2 U630 ( .A(dividend_reg[5]), .B(n554), .Z(n560) );
  NR2 U631 ( .A(n560), .B(n559), .Z(n556) );
  ND2 U632 ( .A(n556), .B(dividend_reg[6]), .Z(n555) );
  AO3 U633 ( .A(n556), .B(dividend_reg[6]), .C(n638), .D(n555), .Z(n558) );
  ND2 U634 ( .A(n635), .B(quotient[6]), .Z(n557) );
  ND2 U635 ( .A(n558), .B(n557), .Z(n337) );
  AO6 U636 ( .A(n560), .B(n722), .C(n559), .Z(n562) );
  ND2 U637 ( .A(n562), .B(dividend_reg[7]), .Z(n561) );
  AO3 U638 ( .A(n562), .B(dividend_reg[7]), .C(n638), .D(n561), .Z(n564) );
  ND2 U639 ( .A(n635), .B(quotient[7]), .Z(n563) );
  ND2 U640 ( .A(n564), .B(n563), .Z(n336) );
  NR2 U641 ( .A(dividend[7]), .B(n565), .Z(n625) );
  AO2 U642 ( .A(n627), .B(Acc[0]), .C(n625), .D(Acc[0]), .Z(n571) );
  FA1A U643 ( .A(n568), .B(n567), .CI(n566), .CO(n576), .S(n569) );
  ND2 U644 ( .A(n571), .B(n570), .Z(n572) );
  ND2 U645 ( .A(n638), .B(n572), .Z(n574) );
  ND2 U646 ( .A(n635), .B(remainder[0]), .Z(n573) );
  ND2 U647 ( .A(n574), .B(n573), .Z(n335) );
  AO2 U648 ( .A(n627), .B(n575), .C(n625), .D(Acc[1]), .Z(n581) );
  FA1A U649 ( .A(n578), .B(n577), .CI(n576), .CO(n586), .S(n579) );
  ND2 U650 ( .A(n581), .B(n580), .Z(n582) );
  ND2 U651 ( .A(n638), .B(n582), .Z(n584) );
  ND2 U652 ( .A(n635), .B(remainder[1]), .Z(n583) );
  ND2 U653 ( .A(n584), .B(n583), .Z(n334) );
  AO2 U654 ( .A(n627), .B(n585), .C(n625), .D(Acc[2]), .Z(n591) );
  FA1A U655 ( .A(n588), .B(n587), .CI(n586), .CO(n596), .S(n589) );
  ND2 U656 ( .A(n591), .B(n590), .Z(n592) );
  ND2 U657 ( .A(n638), .B(n592), .Z(n594) );
  ND2 U658 ( .A(n635), .B(remainder[2]), .Z(n593) );
  ND2 U659 ( .A(n594), .B(n593), .Z(n333) );
  AO2 U660 ( .A(n627), .B(n595), .C(n625), .D(Acc[3]), .Z(n601) );
  FA1A U661 ( .A(n598), .B(n597), .CI(n596), .CO(n606), .S(n599) );
  ND2 U662 ( .A(n601), .B(n600), .Z(n602) );
  ND2 U663 ( .A(n638), .B(n602), .Z(n604) );
  ND2 U664 ( .A(n635), .B(remainder[3]), .Z(n603) );
  ND2 U665 ( .A(n604), .B(n603), .Z(n332) );
  AO2 U666 ( .A(n627), .B(n605), .C(n625), .D(Acc[4]), .Z(n611) );
  FA1A U667 ( .A(n608), .B(n607), .CI(n606), .CO(n616), .S(n609) );
  ND2 U668 ( .A(n611), .B(n610), .Z(n612) );
  ND2 U669 ( .A(n638), .B(n612), .Z(n614) );
  ND2 U670 ( .A(n635), .B(remainder[4]), .Z(n613) );
  ND2 U671 ( .A(n614), .B(n613), .Z(n331) );
  AO2 U672 ( .A(n627), .B(n615), .C(n625), .D(Acc[5]), .Z(n621) );
  FA1A U673 ( .A(n618), .B(n617), .CI(n616), .CO(n628), .S(n619) );
  ND2 U674 ( .A(n621), .B(n620), .Z(n622) );
  ND2 U675 ( .A(n638), .B(n622), .Z(n624) );
  ND2 U676 ( .A(n635), .B(remainder[5]), .Z(n623) );
  ND2 U677 ( .A(n624), .B(n623), .Z(n330) );
  AO2 U678 ( .A(n627), .B(n626), .C(n625), .D(Acc[6]), .Z(n633) );
  FA1A U679 ( .A(n630), .B(n629), .CI(n628), .CO(n457), .S(n631) );
  ND2 U680 ( .A(n633), .B(n632), .Z(n634) );
  ND2 U681 ( .A(n638), .B(n634), .Z(n637) );
  ND2 U682 ( .A(n635), .B(remainder[6]), .Z(n636) );
  ND2 U683 ( .A(n637), .B(n636), .Z(n329) );
  NR2 U684 ( .A(n638), .B(n640), .Z(n639) );
  EO1 U685 ( .A(n639), .B(n711), .C(n705), .D(n639), .Z(n327) );
  NR2 U686 ( .A(n686), .B(n640), .Z(n645) );
  AO6 U687 ( .A(N[0]), .B(n642), .C(n645), .Z(n648) );
  ND2 U688 ( .A(N[1]), .B(n642), .Z(n641) );
  ND2 U689 ( .A(n648), .B(n641), .Z(n651) );
  AO6 U690 ( .A(n642), .B(N[2]), .C(n651), .Z(n643) );
  AO4 U691 ( .A(n645), .B(n698), .C(n643), .D(n721), .Z(n326) );
  NR2 U692 ( .A(n645), .B(n644), .Z(n649) );
  ND2 U693 ( .A(n649), .B(n727), .Z(n647) );
  ND2 U694 ( .A(N[0]), .B(n645), .Z(n646) );
  ND2 U695 ( .A(n647), .B(n646), .Z(n325) );
  AO2 U696 ( .A(N[1]), .B(n648), .C(n647), .D(n728), .Z(n324) );
  ND2 U697 ( .A(n650), .B(n649), .Z(n653) );
  ND2 U698 ( .A(N[2]), .B(n651), .Z(n652) );
  ND2 U699 ( .A(n653), .B(n652), .Z(n323) );
  EO1 U700 ( .A(n695), .B(n712), .C(shift_dividend_reg[1]), .D(n695), .Z(n322)
         );
  ND2 U701 ( .A(dividend[7]), .B(n658), .Z(n681) );
  IVP U702 ( .A(N79), .Z(n688) );
  ND2 U703 ( .A(n689), .B(n688), .Z(n680) );
  NR2 U704 ( .A(dividend[2]), .B(n680), .Z(n673) );
  ND2 U705 ( .A(n673), .B(n672), .Z(n668) );
  NR2 U706 ( .A(dividend[4]), .B(n668), .Z(n663) );
  ND2 U707 ( .A(n663), .B(n662), .Z(n657) );
  NR2 U708 ( .A(n681), .B(n657), .Z(n659) );
  IVP U709 ( .A(dividend[6]), .Z(n654) );
  AO2 U710 ( .A(n687), .B(dividend_reg[7]), .C(n659), .D(n654), .Z(n656) );
  ND2 U711 ( .A(n686), .B(shift_dividend_reg[7]), .Z(n655) );
  AO3 U712 ( .A(n679), .B(n350), .C(n656), .D(n655), .Z(n321) );
  IVP U713 ( .A(n681), .Z(n691) );
  ND2 U714 ( .A(n691), .B(n657), .Z(n666) );
  AO2 U715 ( .A(dividend_reg[6]), .B(n687), .C(n686), .D(shift_dividend_reg[6]), .Z(n661) );
  ND2 U716 ( .A(n658), .B(n350), .Z(n678) );
  ND2 U717 ( .A(n679), .B(n678), .Z(n692) );
  AO7 U718 ( .A(n659), .B(n692), .C(dividend[6]), .Z(n660) );
  AO3 U719 ( .A(dividend[6]), .B(n666), .C(n661), .D(n660), .Z(n319) );
  EO1 U720 ( .A(n695), .B(n722), .C(shift_dividend_reg[7]), .D(n695), .Z(n318)
         );
  NR2 U721 ( .A(n663), .B(n662), .Z(n667) );
  AO2 U722 ( .A(dividend_reg[5]), .B(n687), .C(n686), .D(shift_dividend_reg[5]), .Z(n665) );
  ND2 U723 ( .A(dividend[5]), .B(n692), .Z(n664) );
  AO3 U724 ( .A(n667), .B(n666), .C(n665), .D(n664), .Z(n317) );
  EO1 U725 ( .A(n695), .B(n713), .C(shift_dividend_reg[6]), .D(n695), .Z(n316)
         );
  ND2 U726 ( .A(n691), .B(n668), .Z(n676) );
  AO2 U727 ( .A(dividend_reg[4]), .B(n687), .C(n686), .D(shift_dividend_reg[4]), .Z(n671) );
  AO3 U728 ( .A(n681), .B(n668), .C(n679), .D(n678), .Z(n669) );
  ND2 U729 ( .A(dividend[4]), .B(n669), .Z(n670) );
  AO3 U730 ( .A(dividend[4]), .B(n676), .C(n671), .D(n670), .Z(n315) );
  EO1 U731 ( .A(n695), .B(n708), .C(shift_dividend_reg[5]), .D(n695), .Z(n314)
         );
  NR2 U732 ( .A(n673), .B(n672), .Z(n677) );
  AO2 U733 ( .A(dividend_reg[3]), .B(n687), .C(n686), .D(shift_dividend_reg[3]), .Z(n675) );
  ND2 U734 ( .A(dividend[3]), .B(n692), .Z(n674) );
  AO3 U735 ( .A(n677), .B(n676), .C(n675), .D(n674), .Z(n313) );
  ND2 U736 ( .A(n691), .B(n680), .Z(n685) );
  AO2 U737 ( .A(dividend_reg[2]), .B(n687), .C(n686), .D(shift_dividend_reg[2]), .Z(n684) );
  AO3 U738 ( .A(n681), .B(n680), .C(n679), .D(n678), .Z(n682) );
  ND2 U739 ( .A(dividend[2]), .B(n682), .Z(n683) );
  AO3 U740 ( .A(dividend[2]), .B(n685), .C(n684), .D(n683), .Z(n311) );
  EO1 U741 ( .A(n695), .B(n723), .C(shift_dividend_reg[3]), .D(n695), .Z(n310)
         );
  AO2 U742 ( .A(dividend_reg[1]), .B(n687), .C(n686), .D(shift_dividend_reg[1]), .Z(n694) );
  EO U743 ( .A(n689), .B(n688), .Z(n690) );
  AO2 U744 ( .A(dividend[1]), .B(n692), .C(n691), .D(n690), .Z(n693) );
  ND2 U745 ( .A(n694), .B(n693), .Z(n309) );
  EO1 U746 ( .A(n695), .B(n714), .C(shift_dividend_reg[2]), .D(n695), .Z(n308)
         );
  NR2 U747 ( .A(n696), .B(n700), .Z(n699) );
  AO3 U748 ( .A(n699), .B(n698), .C(error), .D(n697), .Z(n707) );
  IVP U749 ( .A(n700), .Z(n702) );
  AO7 U750 ( .A(n703), .B(n702), .C(n701), .Z(n704) );
  ND2 U751 ( .A(n705), .B(n704), .Z(n706) );
  ND2 U752 ( .A(n707), .B(n706), .Z(n299) );
endmodule

