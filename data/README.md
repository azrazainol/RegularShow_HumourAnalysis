# Datasets
## Regular Show Season 1 Script
data/regularshow_season1_20240418_raw.txt contains the txt file for the combined scripts of Regular Show Season 1

## Humour Dataset from Family Guy Show
data/humour1.csv source: https://www.kaggle.com/datasets/eswarreddy12/family-guy-dialogues-with-various-lexicon-ratings/data?select=GPT_lex11.csv
This file contains the list of humour words for the Family Guy Show.
Word      : word
Rating    : humour rating of the word

## Humour Dataset from Humor Norms
data/humor2.csv source: https://github.com/tomasengelthaler/HumorNorms , https://link.springer.com/article/10.3758/s13428-017-0930-6
This file contains the list of words and the humour rating collected from a study by Engelthaler and Hills (2018).

word      : word
mean      : mean humour rating for all participants
sd        : standard deviation of humour rating for all participants
n         : number of participants rating the word
mean_M    : mean humour rating for male participants
sd_M      : standard deviation of humour rating for male participants
n_M       : number of male participants rating the word
mean_F    : mean humour rating for female participants
sd_F      : standard deviation of humour rating for female participants
n_F       : number of female participants rating the word
mean_young: mean humour rating for young (age ≤32) participants
sd_young  : standard deviation of humour rating for young (age ≤32) participants
n_young   : number of young (age ≤32) participants rating the word
mean_old  : mean humour rating for old (age >32) participants
sd_old    : standard deviation of humour rating for (age >32) participants
n_old     : number of (age >32) participants rating the word

## Humour Combined Dataset
This file contains the list of combined humour words from humour1.csv and humour2.csv.
Word      : word
Rating    : humour rating of the word

The two datasets are combined by filtering duplicate words and keeping the ones from humour2.csv because humour1.csv was created based on the Family Guy Show and the humour2.csv was formd by a study on humour in general context. Only the 'word' and 'mean' columns from humour2.csv is kept to represent the word and humour level in the combined dataset. The mean for words from humour2.csv is multiplied by two to match the rating level in humour1.csv.

## Reference:
Engelthaler, T., Hills, T.T. Humor norms for 4,997 English words. Behav Res 50, 1116–1124 (2018). https://doi.org/10.3758/s13428-017-0930-6
