# STQD6324_Assignment_01

## Introduction

This project used Natural Language Processing (NLP) methods on Regular Show Season 1 (2010) scripts. The Regular Show is an animated show starring two friends, Mordecai (a blue jay) and Rigby (a raccoon). This show was played on Cartoon Network, a TV channel known for airing shows for kids.

The aim of this project is to find the dominant sentiments and emotions that appear in Regular Show Season 1 (2010), to create a word cloud to visualise the most used word in the show, to identify the language complexity in the show, and to find the humour rating of the show. Based on the aims, the analysis includes:


    1. Sentiment and emotion classification analysis
    2. Word cloud analysis
    3. Vocabulary richness (Type-Token Ratio (TTR)), Sentence Length and Readability (Flesch-Kincaid Grade)
    4. Humour analysis


The analysis is carried out using R. The analysis is performed with hopes of finding the main theme of the entire show and whether the show contains appropriate content for the intended audience as there are a number of online communities that claim the show as inappropriate for kids.

## Methodology

Data is scraped from (https://transcripts.thedealr.net/script.php/regular-show-2010-7Avc/s1) and saved as a txt file (https://github.com/azrazainol/STQD6324_Assignment_01/blob/main/data/regularshow_season1_20240418_raw.txt). The data is cleaned before performing analysis.

## Results and Findings

First is the sentiment and emotion classification analysis. ![Image](https://github.com/azrazainol/STQD6324_Assignment_01/blob/7ae980ca3f4ecb006b2348b8f4fd065621de759f/output%20files/sentiment_regularshow_20240426.png)
Based on the sentiment histogram, the sentiment of the show is mostly negative where the mode of the sentiment is 0.25. This shows that the show contains words that are mostly negative and this could influence young people who watch the show negatively as this show exposes them to using negative vocabulary at a young age.

![Image](https://github.com/azrazainol/STQD6324_Assignment_01/blob/0b6a2e129a074c48dea1a74dd52a080f327e9a60/output%20files/emotionclass_regularshow_20240426.png)
As for the emotion classification bar chart, anticipation is the highest emotion followed by trust. The third highest emotion is joy. These top three emotions from Regular Show Season 1 are usually associated with positivity. Despite the sentiment analysis showing a negative sentiment, the emotion classification analysis shows otherwise. This may be due to the nuances in words that could not be detected by the packages used for analysis, resulting in this difference. Regardless, the positive emotions that appear in this show could possibly influence children positively.

Second is the word cloud analysis. ![Image](https://github.com/azrazainol/STQD6324_Assignment_01/blob/0b6a2e129a074c48dea1a74dd52a080f327e9a60/output%20files/wordcloud_regularshow_20240426.png)
The word cloud above shows that the most used word in the show is "dude" which may suggest the language used in the show is more laidback. The other words that appear large in the word cloud are "just", "get" and "know", followed by "mordecai", "gonna", "like", "one" and "can". These words do not really suggest any theme aside from the language used in the show being very casual.

Next is the language complexity analysis.
The vocabulary richness is calculated by the number of unique words that appear in the script divided by the total number of words in the script. The higher the value, the richer the vocabulary. The result for Regular Show Season 1 is 0.1196 which is very low and indicates that words are used repetitively. This may be due to the nature of kids' shows (non-educational) that are supposed to be light and fun material. In addition, the average sentence length of the script is 4.9862 which shows that the show contains very short sentences. The average sentence length of 5 words per sentence should make the show easier to understand for children considering that the average sentence length of a child between 10 to 14 years is two to seven words (White, & Banks, 2021). This shows that the show has appropriate sentence length for a young audience.
The readability is measured using the Flesch-Kincaid Grade grading method. The package "syllable" was employed for this analysis which calculates the number of words per sentence and the number of syllables per word. The formula is 0.39 * words_per_sentence + 11.8 * syllables_per_word - 15.59. This formula is developed based on the American schooling system where the grade of the Flesch-Kincaid Grade method is the grade required to read the text. A grade of 1 is for 1st graders, grade 2 is for 2nd graders and so on. The readability score for the script is 1.04009 which indicates that the show's script is easy and can be read by 1st graders.

Finally, the humour analysis ![Image](https://github.com/azrazainol/STQD6324_Assignment_01/blob/0b6a2e129a074c48dea1a74dd52a080f327e9a60/output%20files/humourlvl_regularshow_20240427.png)
The histogram shows that the mode of the humour level of the show is 4.25. The average is 3.9424 which is lower than half. This could mean that the show is not entirely humorous but still has plenty of humorous words. A limitation is that the humour lexicon used for this analysis is underdeveloped as there are many words that did not have any documented humour rating. Further analysis could be made if there are future studies that develop a better humour rating lexicon.

To conclude, the analysis shows that the show is a laidback and fun show but can have a negative influence on young viewers and would need parental guidance.

#### Credits
This project utilizes the syllable package (https://github.com/trinker/syllable) created by trinker(https://github.com/trinker). We're grateful for their hard work and contribution to the open-source community.

#### References
Darling-White M, Banks SW. Speech Rate Varies With Sentence Length in Typically Developing Children. J Speech Lang Hear Res. 2021 Jun 18;64(6S):2385-2391. doi: 10.1044/2020_JSLHR-20-00276
