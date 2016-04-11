# Introduction

## Motivation

## Framework for Computerized Adaptive Practice

- general idea of framework
    - abstraction over concrete form of practiced items
    - users declare what they should know vs. users select items (and their order) to practice
    - architecture?
- implemented systems:
    - https://outlinemaps.org
    - https://practiceanatomy.com

# State of the Art

## Models for Declarative Knowledge

## Instructional Policy

## Evaluation

# Model (?)

- 0 %

# Instructional Policy

- 95 % (without the impact on data collection)
- main idea of question construction implemented in proso-apps;
- its phases and parameters;
    - describe an idea of probabilistic selection of distractors based on their
      competivness (or modified)
- natural extensions;

## Impact on Data Collection

- 70 %
- instructional policy directly influences the collected data;
- it makes the analysis of historical data more difficult
    - distribution of answers over items is highly scued
    - offline evaluation of predictive models can be affected
    - we can not use this data for evaluation of instructional policy

# Methods for Online Evaluation

- 70 % (without case studies)
- online AB testing
- collecting random data
- engagement:
    - users' feedback
    - survival curves
    - percentage of returning users
- learning:
    - learning curves (several variants)
- attrition bias
    - users quits the practice any time
    - different users tend to practice contexts in different order
    - **solution (?)**
- high aggregation
    - contexts have different characteristics, which leads to different
      behavior of users and algorithm

## Case Studies

- 65 %
- randomization of item selection and selection of distractors (outlinemaps)
- target difficulty (outlinemaps, practiceanatomy)
- competivness of distractors, number of distractors (outlinemaps, probably not positive results)
- **comparing of dump predictive model to ours (?, 0%)**


# Conclusions

## Summary

## Future Work
