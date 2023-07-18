# caleo.aleo

# Caleo: A Calorie Tracking Application

Caleo is a calorie tracking application that uses Aleo blockchain technology. It is designed for use by trainers to mint daily caloric allowances for their trainees based on their performance and physical condition.

## The Mint Function

The core functionality of the Caleo application is provided by the `mint` function. This function takes several input parameters and uses them to calculate the daily caloric allowance for a specified individual.

### Input Parameters

The `mint` function takes the following input parameters:

- `owner`: The address of the individual for whom the daily caloric allowance is being calculated.
- `weight`: The weight of the individual in kilograms.
- `gender`: The gender of the individual, represented as a binary value where 0 represents male and 1 represents female.
- `age`: The age of the individual in years.
- `height`: The height of the individual in centimeters.
- `activity_level`: The activity level of the individual, represented as an integer value where 0 represents sedentary, 1 represents lightly active, 2 represents moderately active, and 3 represents very active.
- `dietary_preference`: The dietary preference of the individual, represented as an integer value where 0 represents low-carb, 1 represents balanced, and 2 represents high-carb.
- `health_goal`: The health goal of the individual, represented as an integer value where 0 represents weight loss, 1 represents maintenance, and 2 represents weight gain.
- `calories_yesterday`: The number of calories consumed by the individual yesterday.
- `todays_training`: The number of calories burned by the individual during today's training.

### Variables

The `mint` function uses several internal variables to perform its calculations. These variables include:

- `bmr`: The basal metabolic rate (BMR) of the individual, calculated using their weight, gender, age, and height.
- `adjusted_bmr`: The BMR adjusted based on the individual's activity level.
- `daily_calories`: The daily caloric needs of the individual, adjusted based on their dietary preference.
- `goal_calories`: The daily caloric needs of the individual, adjusted based on their health goal.
- `allowance`: The final daily caloric allowance for the individual, calculated by subtracting the calories consumed yesterday from the goal calories and adding today's training.

### Outputs

The `mint` function returns a tuple containing five values:

1. A new `Calorie` record with the calculated daily caloric allowance for the specified individual.
2. The calculated BMR of the individual.
3. The adjusted BMR of the individual.
4. The daily caloric needs of the individual.
5. The final daily caloric allowance for the individual.

## Harris-Benedict Equation and Metabolic Rate

The Harris-Benedict equation is a formula that calculates an individual's basal metabolic rate (BMR) by taking into account their weight, height, age, and gender. The BMR represents the number of calories that an individual's body needs to perform basic functions at rest, such as breathing, circulating blood, and maintaining hormone levels. Knowing your BMR is important because it helps you determine how many calories you may want to consume based on your goals.

Metabolic rate refers to the rate at which an individual's body converts food into energy. It is important because it provides the body with the energy it needs to perform essential functions such as breathing and digestion. An individual's body needs a minimum number of calories to sustain these functions. Factors such as age, sex, muscle mass, and physical activity can affect an individual's metabolic rate or BMR.

## Input File

In addition to defining the `mint` function in the `main.leo` file, Caleo also includes an input file named `caleo.in`. This file specifies values for each of the input parameters of the `mint` function. These values are used when running the program to calculate the daily caloric allowance for a specified individual.

Here is an example of an input file:

```
// The program input for simple_token/src/main.leo
[mint]
owner: address = aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7;
weight: u64 = 75u64;
gender: u64 = 1u64;
age: u64 = 30u64;
height: u64 = 180u64;
activity_level: u64 = 1u64;
dietary_preference: u64 = 1u64;
health_goal: u64 = 1u64;
calories_yesterday: u64 = 2000u64;
todays_training: u64 = 500u64;
```

In this example, values are specified for each of the input parameters of the `mint` function. When running Caleo with this input file, it will calculate a daily caloric allowance for an individual with a weight of 75 kilograms, a gender of female (represented by a value of 1), an age of 30 years, a height of 180 centimeters, an activity level of lightly active (represented by a value of 1), a dietary preference of balanced (represented by a value of 1), a health goal of maintenance (represented by a value of 1), who consumed 2000 calories yesterday and burned 500 calories during today's training.

## Conclusion

Caleo is a powerful calorie tracking application that uses Aleo blockchain technology to provide trainers with an easy way to mint daily caloric allowances for their trainees. By using Caleo, trainers can help their trainees achieve their health goals by providing them with accurate and personalized caloric recommendations. With its detailed `mint` function and easy-to-use input file, Caleo is a valuable tool for anyone looking to improve their health and fitness.

## Build Guide

To compile this Aleo program, run:

```bash
snarkvm build
```

To execute this Aleo program, run:

```bash
snarkvm run hello
```
