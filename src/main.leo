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

transition mint(owner: address, weight: u64, gender: u64, age: u64, height: u64, activity_level: u64, dietary_preference: u64, health_goal: u64, calories_yesterday: u64) -> (Calorie, u64, u64, u64, u64) {
    // Calculate the individual's basal metabolic rate (BMR)
    let bmr: u64 = 0u64;
    if gender == 0u64 {
        bmr = 88u64 + (13u64 * weight) + (4u64 * height) - (5u64 * age);
    } else {
        bmr = 447u64 + (9u64 * weight) + (3u64 * height) - (4u64 * age);
    }

    // Adjust the BMR based on the individual's activity level
    let adjusted_bmr: u64 = 0u64;
    if activity_level == 0u64 {
        adjusted_bmr = bmr * 12u64 / 10u64;
    } else if activity_level == 1u64 {
        adjusted_bmr = bmr * 13u64 / 10u64;
    } else if activity_level == 2u64 {
        adjusted_bmr = bmr * 15u64 / 10u64;
    } else {
        adjusted_bmr = bmr;
    }

    // Adjust the daily caloric needs based on the individual's dietary preference
    let daily_calories: u64 = 0u64;
    if dietary_preference == 0u64 {
        daily_calories = adjusted_bmr * 8u64 / 10u64;
    } else if dietary_preference == 1u64 {
        daily_calories = adjusted_bmr;
    } else {
        daily_calories = adjusted_bmr;
    }

    // Adjust the daily caloric needs based on the individual's health goal
    let goal_calories: u64 = 0u64;
    if health_goal == 0u64 {
        goal_calories = daily_calories * 8u64 / 10u64;
    } else if health_goal == 1u64 {
        goal_calories = daily_calories;
    } else if health_goal == 2u64 {
        goal_calories = daily_calories * 11u64 / 10u64;
    } else {
        goal_calories = daily_calories;
    }

    // Calculate the final daily caloric allowance
    let allowance: u64 = goal_calories - calories_yesterday;

    // Create a new Calorie record with the calculated daily caloric allowance
    let calorie_record: Calorie = Calorie {
        owner: owner,
        amount: allowance,
    };
    
    return (calorie_record, bmr, adjusted_bmr, daily_calories, allowance);
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
