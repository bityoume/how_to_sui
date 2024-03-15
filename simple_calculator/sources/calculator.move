module simple_calculator::Calculator {

    use sui::event;
    use sui::tx_context::{Self, TxContext};

    const ErrFirstNumberLessThanSecondNumber: u64 = 1;
    const ErrDivideByZero: u64 = 2;

    struct EventResult has  copy, drop {
        sender: address,
        result: u64,
    }

    public entry fun add(a: u64, b: u64, ctx: &TxContext ): u64{
        let sender = tx_context::sender(ctx);
        let result = a + b;
        event::emit(EventResult { sender, result });   
        result
    }

    public entry fun subtract(a: u64, b: u64, ctx: &TxContext ): u64{
        assert!(a >= b, ErrFirstNumberLessThanSecondNumber);
        let sender = tx_context::sender(ctx);
        let result = a - b;
        event::emit(EventResult { sender, result });   
        result
    }
}