# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Caden Anderson, Brolen Gumb

## Summary
This lab exlpores two methods for clock division, Modulo Counters and Ripple Counters.
After implementing both, we then demonstrated their functionality using a Basys3 Board.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
    * The modulo counter toggles its output state each time the desired count is reached. Because a full clock cycle requires two transitions, one from low to high and one back to low, it takes two complete counting cycles to generate a single output period.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
    * In a ripple counter, an uninitialized state or an asynchronous reset release can cause an immediate transition across all bits.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?
    * To divide a 100 MHz clock down to ~1 kHz using a ripple counter, you would need 17 stages, as 2^16 results in ~1.5 kHz
