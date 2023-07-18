// The 'caleo' program.
program caleo.aleo {

    

       // The `Calorie` record datatype.
    record Calorie {
        // The token owner.
        owner: address,
        // The token amount representing the remaining daily calories.
        amount: u64,
    }
    // The `mint` function initializes a new record with the
    // specified number of calories assigned to the specified receiver.
    transition mint(owner: address, amount: u64, gender: u64) -> Calorie {
        let max_man: u64 = 2500u64;
        let max_woman: u64 = 2000u64;
        if gender == 0u64 {
        // Update the amount to the maximum number of calories for a man
        amount = max_man;
    } else {amount = max_woman;} 
        return Calorie {
            owner: owner,
            amount: amount,
 
        };
    }
    // The `transfer` function sends the specified number of calories
    // to the receiver from the provided calorie record.
    transition transfer(calorie: Calorie, to: address, amount: u64) -> (Calorie, Calorie) {
        // Checks the given calorie record has sufficient balance.
        // This `sub` operation is safe, and the proof will fail
        // if an overflow occurs.
        // `difference` holds the change amount to be returned to sender.
        
        let difference: u64 = calorie.amount - amount;
        // Produce a calorie record with the change amount for the sender.
        let remaining: Calorie = Calorie {
            owner: calorie.owner,
            amount: difference,
        
        };
        // Produce a calorie record for the specified receiver.
        let transferred: Calorie = Calorie {
            owner: to,
            amount: amount,
           
        };
        // Output the sender's change record and the receiver's record.
        return (remaining, transferred);
    }

    
  
}
