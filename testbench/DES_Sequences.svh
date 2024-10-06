class DES_Base_Seq extends uvm_sequence#(DES_Seq_Item);
    `uvm_object_utils(DES_Base_Seq)
    int num_transactions=350;
    DES_Seq_Item item;
    function new(string name="DES_Base_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0;})
        else `uvm_fatal("DES_Base_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_Base_Seq
class DES_Rst_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Rst_Seq)
    int num_transactions=64;
    DES_Seq_Item item;
    function new(string name="DES_Rst_Seq");
        super.new(name);
    endfunction
    virtual task body();
       lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0;
                                    })
        else `uvm_fatal("DES_Rst_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_Rst_Seq
class DES_Encrypt_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_Seq)
    int num_transactions=64;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_Seq");
        super.new(name);
    endfunction
    virtual task body();
       lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                    })
        else `uvm_fatal("DES_Encrypt_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_Encrypt_Seq
class DES_Encrypt_Max_Min_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_Max_Min_Seq)
    int num_transactions=10;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_Max_Min_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      in_data=='0 || in_data=='1;
                                      in_key=='0 || in_key=='1;})
        else `uvm_fatal("DES_Encrypt_Max_Min_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_Encrypt_Max_Min_Seq
class DES_Encrypt_all_Zeros_key_diff_plaintext_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_all_Zeros_key_diff_plaintext_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_all_Zeros_key_diff_plaintext_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      $countones(in_data)==count;
                                      in_key=='0 ;})
        else `uvm_fatal("DES_Encrypt_all_Zeros_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_Encrypt_all_Zeros_key_diff_plaintext_Seq
class DES_Encrypt_all_Ones_key_diff_plaintext_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_all_Ones_key_diff_plaintext_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_all_Ones_key_diff_plaintext_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      $countones(in_data)==count;
                                      in_key=='1 ;})
        else `uvm_fatal("DES_Encrypt_all_Ones_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_Encrypt_all_Ones_key_diff_plaintext_Seq
class DES_Encrypt_all_Zeros_plaintext_diff_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_all_Zeros_plaintext_diff_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_all_Zeros_plaintext_diff_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      $countones(in_key)==count;
                                      in_data=='0 ;})
        else `uvm_fatal("DES_Encrypt_all_Zeros_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_Encrypt_all_Zeros_plaintext_diff_key_Seq
class DES_Encrypt_all_Ones_plaintext_diff_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_all_Ones_plaintext_diff_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_all_Ones_plaintext_diff_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
       lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      $countones(in_key)==count;
                                      in_data=='1 ;})
        else `uvm_fatal("DES_Encrypt_all_Ones_plaintext_diff_key_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_Encrypt_all_Ones_plaintext_diff_key_Seq
class DES_Encrypt_diff_plaintext_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Encrypt_diff_plaintext_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_Encrypt_diff_plaintext_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==0;
                                      $countones(in_key)==count;
                                      $countones(in_data)==count ;})
        else `uvm_fatal("DES_Encrypt_diff_plaintext_key_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_Encrypt_diff_plaintext_key_Seq
class DES_decrypt_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_Seq)
    int num_transactions=64;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;})
        else `uvm_fatal("DES_decrypt_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_decrypt_Seq
class DES_decrypt_Max_Min_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_Max_Min_Seq)
    int num_transactions=10;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_Max_Min_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      in_data=='0 || in_data=='1;
                                      in_key=='0 || in_key=='1;})
        else `uvm_fatal("DES_decrypt_Max_Min_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_decrypt_Max_Min_Seq
class DES_decrypt_all_Zeros_key_diff_plaintext_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_all_Zeros_key_diff_plaintext_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_all_Zeros_key_diff_plaintext_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      $countones(in_data)==count;
                                      in_key=='0 ;})
        else `uvm_fatal("DES_decrypt_all_Zeros_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_decrypt_all_Zeros_key_diff_plaintext_Seq
class DES_decrypt_all_Ones_key_diff_plaintext_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_all_Ones_key_diff_plaintext_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_all_Ones_key_diff_plaintext_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      $countones(in_data)==count;
                                      in_key=='1 ;})
        else `uvm_fatal("DES_decrypt_all_Ones_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_decrypt_all_Ones_key_diff_plaintext_Seq
class DES_decrypt_all_Zeros_plaintext_diff_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_all_Zeros_plaintext_diff_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_all_Zeros_plaintext_diff_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      $countones(in_key)==count;
                                      in_data=='0 ;})
        else `uvm_fatal("DES_decrypt_all_Zeros_key_diff_plaintext_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_decrypt_all_Zeros_plaintext_diff_key_Seq
class DES_decrypt_all_Ones_plaintext_diff_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_all_Ones_plaintext_diff_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_all_Ones_plaintext_diff_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
       lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      $countones(in_key)==count;
                                      in_data=='1 ;})
        else `uvm_fatal("DES_decrypt_all_Ones_plaintext_diff_key_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_decrypt_all_Ones_plaintext_diff_key_Seq
class DES_decrypt_diff_plaintext_key_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_decrypt_diff_plaintext_key_Seq)
    int num_transactions=64;
    int count=0;
    DES_Seq_Item item;
    function new(string name="DES_decrypt_diff_plaintext_key_Seq");
        super.new(name);
    endfunction
    virtual task body();
        lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      encrypt_decrypt==1;
                                      $countones(in_key)==count;
                                      $countones(in_data)==count ;})
        else `uvm_fatal("DES_decrypt_diff_plaintext_key_Seq","Randomization Failed")
        finish_item(item);
        count=count+1;
    endtask
endclass:DES_decrypt_diff_plaintext_key_Seq
class DES_Rand_Seq extends DES_Base_Seq;
    `uvm_object_utils(DES_Rand_Seq)
    int num_transactions=128;
    DES_Seq_Item item;
    function new(string name="DES_Rand_Seq");
        super.new(name);
    endfunction
    virtual task body();
       lock(m_sequencer);
        repeat(num_transactions) begin
            do_item();
        end
        unlock(m_sequencer);
    endtask
    virtual task do_item();
        item=DES_Seq_Item::type_id::create("item");
        start_item(item);
        assert(item.randomize() with {reset_mode==0; 
                                      in_data inside {[(2**4):(2**16)-1]};
                                      in_key inside {[(2**4):(2**16)-1]};
                                    })
        else `uvm_fatal("DES_Rand_Seq","Randomization Failed")
        finish_item(item);
    endtask
endclass:DES_Rand_Seq