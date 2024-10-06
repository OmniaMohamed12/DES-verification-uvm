/*######################################################################*\
## Class Name: DES_Seq_Library  
## Author : Omnia Mohamed
## Date: sep 2024
## 
\*######################################################################*/
class DES_Seq_Library extends uvm_sequence_library#(DES_Seq_Item);
    `uvm_object_utils(DES_Seq_Library)
    `uvm_sequence_library_utils(DES_Seq_Library)

    DES_Base_Seq seq;
    DES_Rst_Seq rstseq;
    DES_Rand_Seq rand_seq;
    // encryption sequences
    DES_Encrypt_Seq seq1;
    DES_Encrypt_Max_Min_Seq seq2;
    DES_Encrypt_all_Zeros_key_diff_plaintext_Seq seq3;
    DES_Encrypt_all_Ones_key_diff_plaintext_Seq seq4;
    DES_Encrypt_all_Zeros_plaintext_diff_key_Seq seq5;
    DES_Encrypt_all_Ones_plaintext_diff_key_Seq seq6;
    DES_Encrypt_diff_plaintext_key_Seq seq7;
    //decryption sequences
    DES_decrypt_Seq seq8;
    DES_decrypt_Max_Min_Seq seq9;
    DES_decrypt_all_Zeros_key_diff_plaintext_Seq seq10;
    DES_decrypt_all_Ones_key_diff_plaintext_Seq seq11;
    DES_decrypt_all_Zeros_plaintext_diff_key_Seq seq12;
    DES_decrypt_all_Ones_plaintext_diff_key_Seq seq13;
    DES_decrypt_diff_plaintext_key_Seq seq14;

    function new(string name="DES_Seq_Library");
        super.new(name);
        add_typewide_sequence(seq.get_type());
        add_typewide_sequence(rstseq.get_type());
        add_typewide_sequence(seq1.get_type());
        add_typewide_sequence(seq2.get_type());
        add_typewide_sequence(seq3.get_type());
        add_typewide_sequence(seq4.get_type());
        add_typewide_sequence(seq5.get_type());
        add_typewide_sequence(seq6.get_type());
        add_typewide_sequence(seq7.get_type());
        add_typewide_sequence(seq8.get_type());
        add_typewide_sequence(seq9.get_type());
        add_typewide_sequence(seq10.get_type());
        add_typewide_sequence(seq11.get_type());
        add_typewide_sequence(seq12.get_type());
        add_typewide_sequence(seq13.get_type());
        add_typewide_sequence(seq14.get_type());
        add_typewide_sequence(rand_seq.get_type());
       
    endfunction
endclass