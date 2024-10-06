/*######################################################################*\
## Class Name: DES_Scoreboard  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Scoreboard extends uvm_scoreboard;
    `uvm_component_utils(DES_Scoreboard)
    uvm_analysis_imp#(DES_Seq_Item,DES_Scoreboard) analysis_imp;
    int passed_cases;
    int failed_cases;

    extern function new(string name="DES_Scoreboard",uvm_component parent=null);
    extern function void build_phase(uvm_phase phase);
    extern function void write(input DES_Seq_Item item);

    extern function bit[1:64] initial_permutation(bit[1:64] plaintext);
    extern function bit[1:64] ip_inverse(bit[1:64] plaintext);
    extern function bit[1:56] pc1(input bit[1:64] key);
    extern function bit[1:48] pc2(input bit[1:56] key);

    extern function bit[28:1] left_shift(input bit[28:1] lhs,input int round_num);
    extern function bit[1:48] ebox(input bit[1:32] in);
    extern function bit[1:32] pbox(input bit[1:32] in);
    extern function bit[1:32] round_fun(input bit[1:32] in,input[1:48] key);
    extern function bit[1:64]encryption (input bit[1:64]plaintext,input bit[1:64]cipherkey);
    extern function bit[1:64]decryption (input bit[1:64]ciphertext,input bit[1:64]cipherkey);
endclass:DES_Scoreboard
function DES_Scoreboard::new(string name="DES_Scoreboard",uvm_component parent=null);
    super.new(name,parent);
endfunction
function void DES_Scoreboard::build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_imp=new("analysis_imp",this);

endfunction
function void DES_Scoreboard::write(input DES_Seq_Item item);
     bit[1:64] expected_cipher_text;
      bit[1:64] expected_plaintext;
    expected_cipher_text=encryption(item.in_data,item.in_key);
    expected_plaintext=decryption(item.in_data,item.in_key);
    if(item.encrypt_decrypt==1'b0)begin
    if(item.out_data == expected_cipher_text)begin
        `uvm_info("DES_Scoreboard","TEST PASSED ",UVM_NONE);
        passed_cases++;
       
    end
    else begin
       `uvm_info("DES_Scoreboard","TEST FAILED ",UVM_NONE);
        failed_cases++;
        `uvm_info("DES_Scoreboard",$sformatf("%0t scb plain text =%0h , key=%0h expected_cipher_text =%0h , actual_cipher_text=%0h",$time ,item.in_data,item.in_key,expected_cipher_text,item.out_data),UVM_MEDIUM);
        
    end
    end
    if(item.encrypt_decrypt==1'b1)begin
        if(item.out_data == expected_plaintext)begin
        `uvm_info("DES_Scoreboard","TEST PASSED ",UVM_NONE);
        passed_cases++;
       
     end
    else begin
       `uvm_info("DES_Scoreboard","TEST FAILED ",UVM_NONE);
        failed_cases++;
        `uvm_info("DES_Scoreboard",$sformatf("%0t scb cipher text =%0h , key=%0h expected_plaintext =%0h , actual_plai_text=%0h",$time ,item.in_data,item.in_key,expected_plaintext,item.out_data),UVM_MEDIUM);

        
    end
    end
    `uvm_info("DES_Scoreboard",$sformatf("num_passed_cases=%0d num_failed_cases=%0d",passed_cases,failed_cases),UVM_MEDIUM);
endfunction
    function bit[1:64] DES_Scoreboard::initial_permutation(bit[1:64] plaintext);
        initial_permutation[1]=plaintext[58];
        initial_permutation[2]=plaintext[50];
        initial_permutation[3]=plaintext[42];
        initial_permutation[4]=plaintext[34];
        initial_permutation[5]=plaintext[26];
        initial_permutation[6]=plaintext[18];
        initial_permutation[7]=plaintext[10];
        initial_permutation[8]=plaintext[2];

        initial_permutation[9]=plaintext[60];
        initial_permutation[10]=plaintext[52];
        initial_permutation[11]=plaintext[44];
        initial_permutation[12]=plaintext[36];
        initial_permutation[13]=plaintext[28];
        initial_permutation[14]=plaintext[20];
        initial_permutation[15]=plaintext[12];
        initial_permutation[16]=plaintext[4];

        initial_permutation[17]=plaintext[62];
        initial_permutation[18]=plaintext[54];
        initial_permutation[19]=plaintext[46];
        initial_permutation[20]=plaintext[38];
        initial_permutation[21]=plaintext[30];
        initial_permutation[22]=plaintext[22];
        initial_permutation[23]=plaintext[14];
        initial_permutation[24]=plaintext[6];

        initial_permutation[25]=plaintext[64];
        initial_permutation[26]=plaintext[56];
        initial_permutation[27]=plaintext[48];
        initial_permutation[28]=plaintext[40];
        initial_permutation[29]=plaintext[32];
        initial_permutation[30]=plaintext[24];
        initial_permutation[31]=plaintext[16];
        initial_permutation[32]=plaintext[8];

        initial_permutation[33]=plaintext[57];
        initial_permutation[34]=plaintext[49];
        initial_permutation[35]=plaintext[41];
        initial_permutation[36]=plaintext[33];
        initial_permutation[37]=plaintext[25];
        initial_permutation[38]=plaintext[17];
        initial_permutation[39]=plaintext[9];
        initial_permutation[40]=plaintext[1];

        initial_permutation[41]=plaintext[59];
        initial_permutation[42]=plaintext[51];
        initial_permutation[43]=plaintext[43];
        initial_permutation[44]=plaintext[35];
        initial_permutation[45]=plaintext[27];
        initial_permutation[46]=plaintext[19];
        initial_permutation[47]=plaintext[11];
        initial_permutation[48]=plaintext[3];

        initial_permutation[49]=plaintext[61];
        initial_permutation[50]=plaintext[53];
        initial_permutation[51]=plaintext[45];
        initial_permutation[52]=plaintext[37];
        initial_permutation[53]=plaintext[29];
        initial_permutation[54]=plaintext[21];
        initial_permutation[55]=plaintext[13];
        initial_permutation[56]=plaintext[5];

        initial_permutation[57]=plaintext[63];
        initial_permutation[58]=plaintext[55];
        initial_permutation[59]=plaintext[47];
        initial_permutation[60]=plaintext[39];
        initial_permutation[61]=plaintext[31];
        initial_permutation[62]=plaintext[23];
        initial_permutation[63]=plaintext[15];
        initial_permutation[64]=plaintext[7];
    endfunction:initial_permutation
    function bit[1:64] DES_Scoreboard::ip_inverse(bit[1:64] plaintext);
        ip_inverse[1]=plaintext[40];
        ip_inverse[2]=plaintext[8];
        ip_inverse[3]=plaintext[48];
        ip_inverse[4]=plaintext[16];
        ip_inverse[5]=plaintext[56];
        ip_inverse[6]=plaintext[24];
        ip_inverse[7]=plaintext[64];
        ip_inverse[8]=plaintext[32];

        ip_inverse[9]=plaintext[39];
        ip_inverse[10]=plaintext[7];
        ip_inverse[11]=plaintext[47];
        ip_inverse[12]=plaintext[15];
        ip_inverse[13]=plaintext[55];
        ip_inverse[14]=plaintext[23];
        ip_inverse[15]=plaintext[63];
        ip_inverse[16]=plaintext[31];

        ip_inverse[17]=plaintext[38];
        ip_inverse[18]=plaintext[6];
        ip_inverse[19]=plaintext[46];
        ip_inverse[20]=plaintext[14];
        ip_inverse[21]=plaintext[54];
        ip_inverse[22]=plaintext[22];
        ip_inverse[23]=plaintext[62];
        ip_inverse[24]=plaintext[30];

        ip_inverse[25]=plaintext[37];
        ip_inverse[26]=plaintext[5];
        ip_inverse[27]=plaintext[45];
        ip_inverse[28]=plaintext[13];
        ip_inverse[29]=plaintext[53];
        ip_inverse[30]=plaintext[21];
        ip_inverse[31]=plaintext[61];
        ip_inverse[32]=plaintext[29];

        ip_inverse[33]=plaintext[36];
        ip_inverse[34]=plaintext[4];
        ip_inverse[35]=plaintext[44];
        ip_inverse[36]=plaintext[12];
        ip_inverse[37]=plaintext[52];
        ip_inverse[38]=plaintext[20];
        ip_inverse[39]=plaintext[60];
        ip_inverse[40]=plaintext[28];

        ip_inverse[41]=plaintext[35];
        ip_inverse[42]=plaintext[3];
        ip_inverse[43]=plaintext[43];
        ip_inverse[44]=plaintext[11];
        ip_inverse[45]=plaintext[51];
        ip_inverse[46]=plaintext[19];
        ip_inverse[47]=plaintext[59];
        ip_inverse[48]=plaintext[27];

        ip_inverse[49]=plaintext[34];
        ip_inverse[50]=plaintext[2];
        ip_inverse[51]=plaintext[42];
        ip_inverse[52]=plaintext[10];
        ip_inverse[53]=plaintext[50];
        ip_inverse[54]=plaintext[18];
        ip_inverse[55]=plaintext[58];
        ip_inverse[56]=plaintext[26];

        ip_inverse[57]=plaintext[33];
        ip_inverse[58]=plaintext[1];
        ip_inverse[59]=plaintext[41];
        ip_inverse[60]=plaintext[9];
        ip_inverse[61]=plaintext[49];
        ip_inverse[62]=plaintext[17];
        ip_inverse[63]=plaintext[57];
        ip_inverse[64]=plaintext[25];

    endfunction:ip_inverse
    function bit[1:56] DES_Scoreboard::pc1(input bit[1:64] key);
        pc1[1]=key[57];
        pc1[2]=key[49];
        pc1[3]=key[41];
        pc1[4]=key[33];
        pc1[5]=key[25];
        pc1[6]=key[17];
        pc1[7]=key[9];

        pc1[8]=key[1];
        pc1[9]=key[58];
        pc1[10]=key[50];
        pc1[11]=key[42];
        pc1[12]=key[34];
        pc1[13]=key[26];
        pc1[14]=key[18];

        pc1[15]=key[10];
        pc1[16]=key[2];
        pc1[17]=key[59];
        pc1[18]=key[51];
        pc1[19]=key[43];
        pc1[20]=key[35];
        pc1[21]=key[27];

        pc1[22]=key[19];
        pc1[23]=key[11];
        pc1[24]=key[3];
        pc1[25]=key[60];
        pc1[26]=key[52];
        pc1[27]=key[44];
        pc1[28]=key[36];

        pc1[29]=key[63];
        pc1[30]=key[55];
        pc1[31]=key[47];
        pc1[32]=key[39];
        pc1[33]=key[31];
        pc1[34]=key[23];
        pc1[35]=key[15];

        pc1[36]=key[7];
        pc1[37]=key[62];
        pc1[38]=key[54];
        pc1[39]=key[46];
        pc1[40]=key[38];
        pc1[41]=key[30];
        pc1[42]=key[22];

        pc1[43]=key[14];
        pc1[44]=key[6];
        pc1[45]=key[61];
        pc1[46]=key[53];
        pc1[47]=key[45];
        pc1[48]=key[37];
        pc1[49]=key[29];

        pc1[50]=key[21];
        pc1[51]=key[13];
        pc1[52]=key[5];
        pc1[53]=key[28];
        pc1[54]=key[20];
        pc1[55]=key[12];
        pc1[56]=key[4];
    endfunction:pc1

    function bit[1:48] DES_Scoreboard::pc2(input bit[1:56] key);
        pc2[1]=key[14];
        pc2[2]=key[17];
        pc2[3]=key[11];
        pc2[4]=key[24];
        pc2[5]=key[1];
        pc2[6]=key[5];

        pc2[7]=key[3];
        pc2[8]=key[28];
        pc2[9]=key[15];
        pc2[10]=key[6];
        pc2[11]=key[21];
        pc2[12]=key[10];

        pc2[13]=key[23];
        pc2[14]=key[19];
        pc2[15]=key[12];
        pc2[16]=key[4];
        pc2[17]=key[26];
        pc2[18]=key[8];

        pc2[19]=key[16];
        pc2[20]=key[7];
        pc2[21]=key[27];
        pc2[22]=key[20];
        pc2[23]=key[13];
        pc2[24]=key[2];
        pc2[25]=key[41];
        pc2[26]=key[52];
        pc2[27]=key[31];
        pc2[28]=key[37];
        pc2[29]=key[47];
        pc2[30]=key[55];

        pc2[31]=key[30];
        pc2[32]=key[40];
        pc2[33]=key[51];
        pc2[34]=key[45];
        pc2[35]=key[33];
        pc2[36]=key[48];

        pc2[37]=key[44];
        pc2[38]=key[49];
        pc2[39]=key[39];
        pc2[40]=key[56];
        pc2[41]=key[34];
        pc2[42]=key[53];

        pc2[43]=key[46];
        pc2[44]=key[42];
        pc2[45]=key[50];
        pc2[46]=key[36];
        pc2[47]=key[29];
        pc2[48]=key[32];

    endfunction:pc2
    function bit[28:1] DES_Scoreboard::left_shift(input bit[28:1] lhs,input int round_num);
        if (round_num ==1 || round_num==2 || round_num==9 || round_num==16)
            left_shift={lhs[27:1],lhs[28]};
        else
            left_shift={lhs[26:1],lhs[28:27]};
    endfunction
    function bit[1:48] DES_Scoreboard::ebox(input bit[1:32] in);
        ebox[1]=in[32];
        ebox[2]=in[1];
        ebox[3]=in[2];
        ebox[4]=in[3];
        ebox[5]=in[4];
        ebox[6]=in[5];

        ebox[7]=in[4];
        ebox[8]=in[5];
        ebox[9]=in[6];
        ebox[10]=in[7];
        ebox[11]=in[8];
        ebox[12]=in[9];

        ebox[13]=in[8];
        ebox[14]=in[9];
        ebox[15]=in[10];
        ebox[16]=in[11];
        ebox[17]=in[12];
        ebox[18]=in[13];

        ebox[19]=in[12];
        ebox[20]=in[13];
        ebox[21]=in[14];
        ebox[22]=in[15];
        ebox[23]=in[16];
        ebox[24]=in[17];

        ebox[25]=in[16];
        ebox[26]=in[17];
        ebox[27]=in[18];
        ebox[28]=in[19];
        ebox[29]=in[20];
        ebox[30]=in[21];

        ebox[31]=in[20];
        ebox[32]=in[21];
        ebox[33]=in[22];
        ebox[34]=in[23];
        ebox[35]=in[24];
        ebox[36]=in[25];

        ebox[37]=in[24];
        ebox[38]=in[25];
        ebox[39]=in[26];
        ebox[40]=in[27];
        ebox[41]=in[28];
        ebox[42]=in[29];

        ebox[43]=in[28];
        ebox[44]=in[29];
        ebox[45]=in[30];
        ebox[46]=in[31];
        ebox[47]=in[32];
        ebox[48]=in[1];
    endfunction:ebox
    function bit[1:32] DES_Scoreboard::pbox(input bit[1:32] in);
        pbox[1]=in[16];
        pbox[2]=in[7];
        pbox[3]=in[20];
        pbox[4]=in[21];
        pbox[5]=in[29];
        pbox[6]=in[12];

        pbox[7]=in[28];
        pbox[8]=in[17];
        pbox[9]=in[1];
        pbox[10]=in[15];
        pbox[11]=in[23];
        pbox[12]=in[26];

        pbox[13]=in[5];
        pbox[14]=in[18];
        pbox[15]=in[31];
        pbox[16]=in[10];
        pbox[17]=in[2];
        pbox[18]=in[8];
        pbox[19]=in[24];
        pbox[20]=in[14];
        pbox[21]=in[32];
        pbox[22]=in[27];
        pbox[23]=in[3];
        pbox[24]=in[9];
        pbox[25]=in[19];
        pbox[26]=in[13];
        pbox[27]=in[30];
        pbox[28]=in[6];
        pbox[29]=in[22];
        pbox[30]=in[11];
        pbox[31]=in[4];
        pbox[32]=in[25];
    endfunction:pbox
function bit[1:32] DES_Scoreboard::round_fun(input bit[1:32] in,input[1:48] key);
    bit[1:48] out_ebox;
    bit[1:16] out_first4sbox;
    bit[1:16] out_last4sbox;
    bit[1:32] out_sbox;
    bit[0:3] s1[4][16];////////////
    bit[0:3] s2[4][16];
    bit[0:3] s3[4][16];
    bit[0:3] s4[4][16];
    bit[0:3] s5[4][16];
    bit[0:3] s6[4][16];
    bit[0:3] s7[4][16];
    bit[0:3] s8[4][16];

s1   = '{'{14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7},
         '{0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8},
         '{4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0},
         '{15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13}};
 
s2=    '{'{15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10},
         '{3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5},
         '{0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15},
         '{13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9}};
 
s3='{    '{10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8},
         '{13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1},
         '{13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7},
         '{1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12}};
 
s4='{    '{7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15},
         '{13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9},
         '{10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4},
         '{3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14}};
s5=    '{'{2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9},
         '{14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6},
         '{4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14},
         '{11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3}};
 
s6=    '{'{12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11},
         '{10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8},
         '{9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6},
         '{4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13}};
 
s7=    '{'{4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1},
         '{13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6},
         '{1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2},
         '{6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12}};
 
s8=    '{'{13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7},
         '{1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2},
         '{7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8},
         '{2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11}};

  
    out_ebox=ebox(in) ^ key;
    out_first4sbox={s1[{out_ebox[1],out_ebox[6]}][out_ebox[2:5]],s2[{out_ebox[7],out_ebox[12]}][out_ebox[8:11]],s3[{out_ebox[13],out_ebox[18]}][out_ebox[14:17]],s4[{out_ebox[19],out_ebox[24]}][out_ebox[20:23]]};
    out_last4sbox={s5[{out_ebox[25],out_ebox[30]}][out_ebox[26:29]],s6[{out_ebox[31],out_ebox[36]}][out_ebox[32:35]],s7[{out_ebox[37],out_ebox[42]}][out_ebox[38:41]],s8[{out_ebox[43],out_ebox[48]}][out_ebox[44:47]]};
    out_sbox={out_first4sbox,out_last4sbox};
    
    round_fun=pbox(out_sbox);
    
    
endfunction:round_fun
function bit[1:64]DES_Scoreboard::encryption (input bit[1:64]plaintext,input bit[1:64]cipherkey);
    bit[56:1]key;
    bit[1:64]in;
    bit[28:1] key_l[17];
    bit[28:1] key_r[17];
    bit[48:1] round_key[17];
    bit[1:32] l[17];//lhs
    bit[1:32] r[17];//rhs
    bit[1:64] ciphertext;
    key=pc1(cipherkey);
    
    key_r[1]=left_shift(key[28:1],1);
    key_l[1]=left_shift(key[56:29],1);
    round_key[1]=pc2({key_l[1],key_r[1]});
    
    for(int i=2;i<17;i++)begin
        key_r[i]=left_shift(key_r[i-1],i);
        key_l[i]=left_shift(key_l[i-1],i);
        round_key[i]=pc2({key_l[i],key_r[i]});
       
    end
    in=initial_permutation(plaintext);
    
    l[0]=in[1:32];
    r[0]=in[33:64];

    for(int i=1;i<17;i++)begin
        l[i]=r[i-1];
        r[i]=l[i-1] ^ round_fun(r[i-1],round_key[i]);
        
    end
    ciphertext=ip_inverse({r[16],l[16]});
    return ciphertext;
endfunction
function bit[1:64]DES_Scoreboard::decryption (input bit[1:64]ciphertext,input bit[1:64]cipherkey);
    bit[56:1]key;
    bit[1:64]in;
    bit[28:1] key_l[17];
    bit[28:1] key_r[17];
    bit[48:1] round_key[17];
    bit[1:32] l[17];//lhs
    bit[1:32] r[17];//rhs
    bit[1:64] plaintext;
    key=pc1(cipherkey);
    key_r[1]=left_shift(key[28:1],1);
    key_l[1]=left_shift(key[56:29],1);
    round_key[1]=pc2({key_l[1],key_r[1]});
    
    for(int i=2;i<17;i++)begin
        key_r[i]=left_shift(key_r[i-1],i);
        key_l[i]=left_shift(key_l[i-1],i);
        round_key[i]=pc2({key_l[i],key_r[i]});
        
    end
    in=initial_permutation(ciphertext);
    
    l[0]=in[1:32];
    r[0]=in[33:64];

    for(int i=1;i<17;i++)begin
        l[i]=r[i-1];
        r[i]=l[i-1] ^ round_fun(r[i-1],round_key[17-i]);
        
    end
    plaintext=ip_inverse({r[16],l[16]});
    return plaintext;
endfunction