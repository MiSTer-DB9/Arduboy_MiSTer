
`define CORE_TYPE_BUS_LEN           10

`define MEGA_CLUSTER                10'b0000000001
`define MEGA_REDUCED                10'b0000000011
`define MEGA_MINIMAL                10'b0000000111
`define MEGA_CLASSIC_8K             10'b0000001111
`define MEGA_CLASSIC_128K           10'b0000011111
`define MEGA_ENHANCED_8K            10'b0000111111
`define MEGA_ENHANCED_128K          10'b0001111111
`define MEGA_ENHANCED_4M            10'b0011111111
`define MEGA_XMEGA_1                10'b0111111111
`define MEGA_XMEGA_2                10'b1111111111

`define MEGA_CLUSTER_INT            10'bxxxxxxxxx1
`define MEGA_REDUCED_INT            10'bxxxxxxxx1x
`define MEGA_REDUCED_LDS16_INT      10'bxxxxxxx0xx
`define MEGA_MINIMAL_INT            10'bxxxxxxx1xx
`define MEGA_CLASSIC_8K_INT         10'bxxxxxx1xxx
`define MEGA_CLASSIC_128K_INT       10'bxxxxx1xxxx
`define MEGA_ENHANCED_8K_INT        10'bxxxx1xxxxx
`define MEGA_ENHANCED_128K_INT      10'bxxx1xxxxxx
`define MEGA_ENHANCED_4M_INT        10'bxx1xxxxxxx
`define MEGA_XMEGA_1_INT            10'bx1xxxxxxxx
`define MEGA_XMEGA_2_INT            10'b1xxxxxxxxx



`define STEP0                       2'h0
`define STEP1                       2'h1
`define STEP2                       2'h2
`define STEP3                       2'h3

`define REG_MODE_8_BIT              1'b0
`define REG_MODE_16_BIT             1'b1

`define XMEGA_FLAG_C                0   //Zero Flag
`define XMEGA_FLAG_Z                1   //Zero Flag
`define XMEGA_FLAG_N                2   //Negative Flag
`define XMEGA_FLAG_V                3   //Two's complement overflow indicator
`define XMEGA_FLAG_S                4   //N?V for signed tests
`define XMEGA_FLAG_H                5   //Half Carry Flag
`define XMEGA_FLAG_T                6   //Transfer bit used by BLD and BST instructions
`define XMEGA_FLAG_I                7   //Global Interrupt Enable/Disable Flag


/*
 * Instruction set.
 */
`define INSTRUCTION_NOP             {`MEGA_CLUSTER_INT,         16'b0000000000000000}
`define INSTRUCTION_MOVW            {`MEGA_ENHANCED_8K_INT,     16'b00000001xxxxxxxx}//00000001DDDDRRRR *
`define INSTRUCTION_MULS            {`MEGA_ENHANCED_8K_INT,     16'b00000010xxxxxxxx}//00000010ddddrrrr *
`define INSTRUCTION_MULSU           {`MEGA_ENHANCED_8K_INT,     16'b000000110xxx0xxx}//000000110ddd0rrr *
`define INSTRUCTION_FMUL            {`MEGA_ENHANCED_8K_INT,     16'b000000110xxx1xxx}//000000110ddd1rrr *
`define INSTRUCTION_FMULS           {`MEGA_ENHANCED_8K_INT,     16'b000000111xxx0xxx}//000000111dddurrr *
`define INSTRUCTION_FMULSU          {`MEGA_ENHANCED_8K_INT,     16'b000000111xxx1xxx}//000000111dddurrr *
`define INSTRUCTION_CPC             {`MEGA_CLUSTER_INT,         16'b000001xxxxxxxxxx}//000001rdddddrrrr *
`define INSTRUCTION_CP              {`MEGA_CLUSTER_INT,         16'b000101xxxxxxxxxx}//000101rdddddrrrr *
`define INSTRUCTION_SBC             {`MEGA_CLUSTER_INT,         16'b000010xxxxxxxxxx}//000010rdddddrrrr *
`define INSTRUCTION_SUB             {`MEGA_CLUSTER_INT,         16'b000110xxxxxxxxxx}//000110rdddddrrrr *
`define INSTRUCTION_ADD             {`MEGA_CLUSTER_INT,         16'b000011xxxxxxxxxx}//000011rdddddrrrr *
`define INSTRUCTION_ADC             {`MEGA_CLUSTER_INT,         16'b000111xxxxxxxxxx}//000111rdddddrrrr *
`define INSTRUCTION_CPSE            {`MEGA_REDUCED_INT,         16'b000100xxxxxxxxxx}//000100rdddddrrrr *
`define INSTRUCTION_AND             {`MEGA_CLUSTER_INT,         16'b001000xxxxxxxxxx}//001000rdddddrrrr *
`define INSTRUCTION_EOR             {`MEGA_CLUSTER_INT,         16'b001001xxxxxxxxxx}//001001rdddddrrrr *
`define INSTRUCTION_OR              {`MEGA_CLUSTER_INT,         16'b001010xxxxxxxxxx}//001010rdddddrrrr *
`define INSTRUCTION_MOV             {`MEGA_CLUSTER_INT,         16'b001011xxxxxxxxxx}//001011rdddddrrrr *
`define INSTRUCTION_CPI             {`MEGA_REDUCED_INT,         16'b0011xxxxxxxxxxxx}//0011kkkkddddkkkk *
`define INSTRUCTION_SUBI            {`MEGA_REDUCED_INT,         16'b0101xxxxxxxxxxxx}//0101kkkkddddkkkk *
`define INSTRUCTION_SBCI            {`MEGA_REDUCED_INT,         16'b0100xxxxxxxxxxxx}//0100kkkkddddkkkk *
`define INSTRUCTION_ORI_SBR         {`MEGA_REDUCED_INT,         16'b0110xxxxxxxxxxxx}//0110kkkkddddkkkk *
`define INSTRUCTION_ANDI_CBR        {`MEGA_REDUCED_INT,         16'b0111xxxxxxxxxxxx}//0111kkkkddddkkkk *
`define INSTRUCTION_LDD             {`MEGA_CLASSIC_8K_INT,      16'b10x0xx0xxxxxxxxx}//10k0kksdddddykkk *
`define INSTRUCTION_STD             {`MEGA_CLASSIC_8K_INT,      16'b10x0xx1xxxxxxxxx}//10k0kksdddddykkk *
`define INSTRUCTION_LDS             {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx0000}//100100sddddd0000 *
`define INSTRUCTION_STS             {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxx0000}//100100sddddd0000 *
`define INSTRUCTION_LD_YZP          {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxxx001}//100100sdddddy001 *
`define INSTRUCTION_ST_YZP          {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxxx001}//100100sdddddy001 *
`define INSTRUCTION_LD_YZN          {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxxx010}//100100sdddddy010 *
`define INSTRUCTION_ST_YZN          {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxxx010}//100100sdddddy010 *
`define INSTRUCTION_LPM_R           {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx01x0}//1001000ddddd0100 *
`define INSTRUCTION_LPM_RE          {`MEGA_ENHANCED_8K_INT,     16'b1001000xxxxx0110}//1001000ddddd0110 *
`define INSTRUCTION_LPM_R_P         {`MEGA_ENHANCED_8K_INT,     16'b1001000xxxxx01x1}//1001000ddddd0101 *
`define INSTRUCTION_LPM_RE_P        {`MEGA_ENHANCED_8K_INT,     16'b1001000xxxxx0111}//1001000ddddd0111 *
`define INSTRUCTION_XCH             {`MEGA_XMEGA_2_INT,         16'b1001001xxxxx0100}//1001001ddddd0100
`define INSTRUCTION_LAS             {`MEGA_XMEGA_2_INT,         16'b1001001xxxxx0101}//1001001ddddd0101
`define INSTRUCTION_LAC             {`MEGA_XMEGA_2_INT,         16'b1001001xxxxx0110}//1001001ddddd0110
`define INSTRUCTION_LAT             {`MEGA_XMEGA_2_INT,         16'b1001001xxxxx0111}//1001001ddddd0111
`define INSTRUCTION_LD_X            {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx1100}//100100sddddd1100 *
`define INSTRUCTION_ST_X            {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxx1100}//100100sddddd1100 *
`define INSTRUCTION_LD_XP           {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx1101}//100100sddddd1101 *
`define INSTRUCTION_ST_XP           {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxx1101}//100100sddddd1101 *
`define INSTRUCTION_LD_XN           {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx1110}//100100sddddd1110 *
`define INSTRUCTION_ST_XN           {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxx1110}//100100sddddd1110 *
`define INSTRUCTION_POP             {`MEGA_CLASSIC_8K_INT,      16'b1001000xxxxx1111}//100100sddddd1111 *
`define INSTRUCTION_PUSH            {`MEGA_CLASSIC_8K_INT,      16'b1001001xxxxx1111}//100100sddddd1111 *
`define INSTRUCTION_COM             {`MEGA_REDUCED_INT,         16'b1001010xxxxx0000}//1001010ddddd0000 *
`define INSTRUCTION_NEG             {`MEGA_REDUCED_INT,         16'b1001010xxxxx0001}//1001010ddddd0001 *
`define INSTRUCTION_SWAP            {`MEGA_REDUCED_INT,         16'b1001010xxxxx0010}//1001010ddddd0010 *
`define INSTRUCTION_INC             {`MEGA_REDUCED_INT,         16'b1001010xxxxx0011}//1001010ddddd0011 *
`define INSTRUCTION_ASR             {`MEGA_REDUCED_INT,         16'b1001010xxxxx0101}//1001010ddddd0101 *
`define INSTRUCTION_LSR             {`MEGA_CLUSTER_INT,         16'b1001010xxxxx0110}//1001010ddddd0110 *
`define INSTRUCTION_ROR             {`MEGA_CLUSTER_INT,         16'b1001010xxxxx0111}//1001010ddddd0111 *
`define INSTRUCTION_SEx_CLx         {`MEGA_REDUCED_INT,         16'b10010100xxxx1000}//10010100Bbbb1000 *
`define INSTRUCTION_RET             {`MEGA_CLUSTER_INT,         16'b1001010100001000}//1001010100001000 *
`define INSTRUCTION_RETI            {`MEGA_REDUCED_INT,         16'b1001010100011000}//1001010100001000 *
`define INSTRUCTION_SLEEP           {`MEGA_REDUCED_INT,         16'b1001010110000000}//1001010100001000
`define INSTRUCTION_BREAK           {`MEGA_ENHANCED_128K_INT,   16'b1001010110011000}//1001010100011000
`define INSTRUCTION_WDR             {`MEGA_REDUCED_INT,         16'b1001010110101000}//1001010100101000 *
`define INSTRUCTION_LPM_ELPM        {`MEGA_MINIMAL_INT,         16'b10010101110x1000}//10010101110q1000 *
`define INSTRUCTION_SPM             {`MEGA_ENHANCED_8K_INT,     16'b1001010111101000}//1001010111101000
`define INSTRUCTION_SPM_Z_P         {`MEGA_XMEGA_1_INT,         16'b1001010111111000}//1001010111111000
`define INSTRUCTION_IJMP            {`MEGA_CLASSIC_8K_INT,      16'b10010100000x1001}//1001010c000e1001 *
`define INSTRUCTION_ICALL           {`MEGA_CLASSIC_8K_INT,      16'b10010101000x1001}//1001010c000e1001 *
`define INSTRUCTION_DEC             {`MEGA_REDUCED_INT,         16'b1001010xxxxx1010}//1001010ddddd1010 *
`define INSTRUCTION_DES             {`MEGA_XMEGA_1_INT,         16'b10010100xxxx1011}//10010100kkkk1011
`define INSTRUCTION_JMP             {`MEGA_CLASSIC_128K_INT,    16'b1001010xxxxx110x}//1001010kkkkk110k *
`define INSTRUCTION_CALL            {`MEGA_CLASSIC_128K_INT,    16'b1001010xxxxx111x}//1001010kkkkk111k *
`define INSTRUCTION_ADIW            {`MEGA_CLASSIC_8K_INT,      16'b10010110xxxxxxxx}//10010110kkppkkkk *
`define INSTRUCTION_SBIW            {`MEGA_CLASSIC_8K_INT,      16'b10010111xxxxxxxx}//10010111kkppkkkk *
`define INSTRUCTION_CBI_SBI         {`MEGA_REDUCED_INT,         16'b100110x0xxxxxxxx}//100110B0aaaaabbb *
`define INSTRUCTION_SBIC_SBIS       {`MEGA_REDUCED_INT,         16'b100110x1xxxxxxxx}//100110B1aaaaabbb *
`define INSTRUCTION_MUL             {`MEGA_ENHANCED_8K_INT,     16'b100111xxxxxxxxxx}//100111rdddddrrrr *
`define INSTRUCTION_LDS16           {`MEGA_REDUCED_LDS16_INT,   16'b10100xxxxxxxxxxx}//10101kkkddddkkkk *
`define INSTRUCTION_STS16           {`MEGA_REDUCED_LDS16_INT,   16'b10101xxxxxxxxxxx}//10101kkkddddkkkk *
`define INSTRUCTION_IN              {`MEGA_REDUCED_INT,         16'b10110xxxxxxxxxxx}//1011saadddddaaaa *
`define INSTRUCTION_OUT             {`MEGA_REDUCED_INT,         16'b10111xxxxxxxxxxx}//1011saadddddaaaa *
`define INSTRUCTION_RJMP            {`MEGA_CLUSTER_INT,         16'b1100xxxxxxxxxxxx}//1100xxxxxxxxxxxx *
`define INSTRUCTION_RCALL           {`MEGA_CLUSTER_INT,         16'b1101xxxxxxxxxxxx}//1101xxxxxxxxxxxx *
`define INSTRUCTION_LDI             {`MEGA_CLUSTER_INT,         16'b1110xxxxxxxxxxxx}//1110KKKKddddKKKK *
`define INSTRUCTION_COND_BRANCH     {`MEGA_CLUSTER_INT,         16'b11110xxxxxxxxxxx}//11110Bxxxxxxxbbb *
`define INSTRUCTION_BLD             {`MEGA_REDUCED_INT,         16'b1111100xxxxx0xxx}//111110sddddd0bbb *
`define INSTRUCTION_BST             {`MEGA_REDUCED_INT,         16'b1111101xxxxx0xxx}//111110sddddd0bbb *
`define INSTRUCTION_SBRC_SBRS       {`MEGA_REDUCED_INT,         16'b111111xxxxxx0xxx}//111111Bddddd0bbb *
/*
 * !Instruction set.
 */
