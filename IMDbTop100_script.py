# -*- coding: utf-8 -*-
"""
Created on Sat Sep 23 23:18:28 2023

@author: domingosdeeulariadumba
"""

# %%
""" IMPORTING LIBRARIES """


import pandas as pd
import numpy as np
import urllib.request as ur
from bs4 import BeautifulSoup as bs

import matplotlib.pyplot as plt
plt.style.use('ggplot')

from sklearn.model_selection import train_test_split as tts
from xgboost import XGBRegressor as xgb
from sklearn.metrics import mean_squared_error as MSE, r2_score

import warnings
warnings.filterwarnings('ignore')
# %%



# %%
"""" DATA EXTRACTION AND CLEANING """


header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36',
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'}

url = 'https://www.imdb.com/chart/top/'

req = ur.Request(url, None, header)

response = ur.urlopen(req)

content = bs(response.read())


    '''
    We next apply feature engineering to extract the relevant details gathered
    from IMDb Top 250 movies. This is then stored in a dataframe and saved as
    a csv file.
    '''
IMDb_top250 = list(content.get_text().split('\xa0'))[1:251]
   
for i in range(len(IMDb_top250)):
    IMDb_top250[i] = IMDb_top250[i].split('. ')[1:]

for i in range (len(IMDb_top250)):
    if len(IMDb_top250[i]) > 1:
        IMDb_top250[i] = '. '.join(IMDb_top250[i])
          
flattened_list = []

for k in IMDb_top250:
    if len(k) >1:
        flattened_list.append(k)
    else:
        flattened_list.extend(k)          

df = pd.DataFrame({'title': flattened_list})

df.to_csv('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/IMDbTop250_dataset.csv')


    '''
    Reimporting the saved dataset.
    '''
df_IMDb = pd.read_csv('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/IMDbTop250_dataset.csv')


    '''
    We have still some work to do. Next, it is applied feature engineering 
    tricks to extract the title, rating and release year from the whole movies
    information in the dataset records.
    '''
rating = []
release_year = []
title =[]

for row in range(len(df_IMDb)):
    
    rating.append(df_IMDb['title'][row][-3:])
    
    for i in range(1,6):        
        if '{0}h'.format(i) in df_IMDb['title'][row]:
            release_year.append(str(df_IMDb['title'][row]).split('{0}h'.format(i))[0][-4:])
            title.append(str(df_IMDb['title'][row]).split('{0}h'.format(i))[0][:-4])
            break
           
    for j in ['mP', 'mA', 'mR', 'mN']:
        
                        if j in df_IMDb['title'][row] and '{0}h'.format(i) not in df_IMDb['title'][row]:
                            release_year.append(str(df_IMDb['title'][row]).split(j)[0][-6:-2])
                            title.append(str(df_IMDb['title'][row]).split(j)[0][:-6])

df_IMDb = pd.DataFrame({'title': title})

                         
    '''
    Below we store all the movies details into a new dataframe and rearrange
    its columns, being the first variable the Top 100 movies DB created in SSMS,
    which contains information about stars, director and further financial
    informations. This is then concatenated with the rest of information
    displayed before.
   '''
DF_IMDb = pd.read_excel('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/IMDbTop100db_FurtherDetails.xlsx')

df_IMDbTop100 = pd.concat([df_IMDb[:100], DF_IMDb], axis = 1)

df_IMDbTop100.insert(1,'release_year',release_year[:100])

df_IMDbTop100.insert(5,'rating',rating[:100])

df_IMDbTop100['release_year'] = df_IMDbTop100['release_year'].astype(int)

df_IMDbTop100['rating'] = df_IMDbTop100['rating'].astype(float)

    
    '''
    Saving the final dataframe.
    '''
df_IMDbTop100.to_csv('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/IMDbTop100_final.csv')
# %%



# %%
"""" EXPLORATORY DATA ANALYSIS """
    

    '''
    Displaying the information of the dataset (including the first and last 
    ten records).
    '''
df_IMDbTop100.info()
df_IMDbTop100.head(10)
df_IMDbTop100.tail(10)


    '''
    From the info, it is noticed three null entries for 'gross_roi' it was set
    for those movies which budget information was not available (considered as
    0 primarily) during the DB creation in SSMS. We'll drop these records.
    '''
df_IMDbTop100 = df_IMDbTop100.dropna()


    '''
    Presenting the statistical summary
    '''
df_IMDbTop100.describe(include = 'all')


    '''
    Who are the 15 most praised directors according to IMDb?
    Besides the overall analysis, it considers frequencies since and before 
    2000.
    '''
df_IMDbTop100['director'].value_counts()[:15].plot(kind = 'bar')
plt.title("15 Most Praised Directors")
plt.xticks(rotation = 80)
plt.legend()
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/Top15DirectorsEver.png')
plt.close()

df_IMDbTop100['director'][df_IMDbTop100['release_year'] < 2000].value_counts()[:15].plot(kind = 'bar')
plt.title('Top 15 Directors 90s')
plt.xticks(rotation = 80)
plt.legend()
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/Top15Directors19s.png')
plt.close()

df_IMDbTop100['director'][df_IMDbTop100['release_year'] >= 2000].value_counts()[:15].plot(kind = 'bar')
plt.title('Top 15 Directors 20s')
plt.xticks(rotation = 80)
plt.legend()
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/Top15Directors20s.png')
plt.close()

    '''
    Who are the 10 best average rated directors (since and before 20s too)?
    '''
AvgRate_total = df_IMDbTop100[['director', 'rating']].groupby(['director'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRate_total['director'], AvgRate_total['Average Rating'])
plt.title('15 Best Rated Directors')
plt.xticks(rotation = 80)
plt.xlabel('')
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectorsEver.png')
plt.close()

AvgRate_19s = df_IMDbTop100[['director', 'rating']][df_IMDbTop100['release_year'] < 2000].groupby(['director'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRate_19s['director'], AvgRate_19s['Average Rating'])
plt.title('15 Best Rated Directors 19s')
plt.xticks(rotation = 80)
plt.xlabel('')
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectors19s.png')
plt.close()

AvgRate_20s = df_IMDbTop100[['director', 'rating']][df_IMDbTop100['release_year'] >= 2000].groupby(['director'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRate_20s['director'], AvgRate_20s['Average Rating'])
plt.title('15 Best Rated Directors 20s')
plt.xticks(rotation = 80)
plt.xlabel('')
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectors20s.png')
plt.close()


    '''
    What countries have more directors whom are between the 10 best reated?
    '''
AvgRateCountries = df_IMDbTop100[['director', 'country', 'rating']].groupby(['country'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRateCountries['country'], AvgRateCountries['Average Rating'])
plt.title("15 Best Rated Directors Countries' Frequency")
plt.xticks(rotation = 88)
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectorsEverCountries.png')
plt.close()

AvgRateCountries_19s = df_IMDbTop100[['director', 'country', 'rating']][df_IMDbTop100['release_year'] < 2000].groupby(['country'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRateCountries_19s['country'], AvgRateCountries_19s['Average Rating'])
plt.xticks(rotation = 88)
plt.title("15 Best Average Rated Directors Countries'\nFrequency in 19s")
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectors19sCountries.png')
plt.close()

AvgRateCountries_20s = df_IMDbTop100[['director', 'country', 'rating']][df_IMDbTop100['release_year'] >= 2000].groupby(['country'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
plt.bar(AvgRateCountries_20s['country'], AvgRateCountries_20s['Average Rating'])
plt.title("15 Best Average Rated Directors Countries'\nFrequency in 20s")
plt.xticks(rotation = 88)
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/15BestRatedDirectors20sCountries.png')
plt.close()


    '''
    Who are the 15 best average rated directors (since and before 20s too)?
    '''
AvgRate_total = df_IMDbTop100[['director', 'rating']].groupby(['director'])['rating'].mean().reset_index(name='Average Rating').sort_values(by='Average Rating', ascending = False)[:15]
sb.barplot(x ='director', y = 'Average Rating', data = AvgRate_total)
plt.title('15 Best Rated Directors')
plt.xticks(rotation = 80)
plt.xlabel('')


    '''
    What about the budget and Box Office of the movies headed by the 10 most 
    IMDb Top 100 praised directors?
    '''
freq = df_IMDbTop100['director'].value_counts().reset_index(name='frequency')[:10]

freq_df = pd.DataFrame({'director': list(freq['index'])})

new_df = pd.merge(df_IMDbTop100, freq_df, how = 'right')[['director','budget', 'box_office']]

plt.bar(new_df['director'],new_df['budget'])
plt.bar(new_df['director'],new_df['box_office'], bottom = new_df['budget'])
plt.xticks(rotation = 80)
plt.title("10 Most Praised Directors\nBudget & Box Office Analysis")
plt.ylabel('Budget & Box Office (Million)')
plt.legend(['Budget', 'Box Office'])
plt.savefig ('C:/Users/domingosdeeularia/Documents/notyourbusiness/CodingAndAnalytics/Projects/IMDbTop100/Top10DirectorsEver_Budget&BoxOfficeAnalysis.png')
plt.close()
# %%



# %%
"""" RELATIONSHIP ANALYSIS """


    '''
    This section aims at understanding the influence of directors in movies 
    success by taking into consideration the rating and its financial aspects
    (budget and Gross ROI).
    '''
    
    
    '''
    Step 1 for rating: setting the dependent and independent variables
    '''
X = pd.get_dummies(df_IMDbTop100['director'],drop_first = True)

y_rating = df_IMDbTop100['rating']


    '''
    Step 2 for rating: splitting data into train and test sets to seed the 
    estimation model
    '''
X_train, X_test, y_train_rating, y_test_rating = tts(X,y_rating, test_size = 0.2,
                                                     random_state = 7)


    '''
    Step 3 for rating: training the model
    '''
XGBreg = xgb()

rating_model = XGBreg.fit(X_train, y_train_rating)

y_hat_rating = rating_model.predict(X_test)

 
    '''
    Step 4 for rating: model performance evaluation
    '''
print('RMSE:', MSE(y_test_rating, y_hat_rating, squared = False))

print('NRMSE:', (MSE(y_test_rating, y_hat_rating,
                     squared = False)/(y_rating.max()-y_rating.min())))

print('Coefficient of determination:', r2_score(y_test_rating, y_hat_rating))


    '''
    Step 1 for budget: setting the dependent variable
    '''
y_budget = df_IMDbTop100['budget']


    '''
    Step 2 for budget: splitting data into train and test sets to seed the 
    estimation model
    '''
X_train, X_test, y_train_budget, y_test_budget = tts(X,y_budget, test_size = 0.2,
                                                     random_state = 7)

 
    '''
    Step 3 for budget: training the model
    '''
budget_model = XGBreg.fit(X_train, y_train_budget)

y_hat_budget = budget_model.predict(X_test)

 
    '''
    Step 4 for budget: model performance evaluation
    ''' 
print('RMSE:', MSE(y_test_budget, y_hat_budget, squared = False))

print('NRMSE:', (MSE(y_test_budget, y_hat_budget,
                     squared = False)/(y_budget.max()-y_budget.min())))

print('Coefficient of determination:', r2_score(y_test_budget, y_hat_budget))


    '''
    Step 1 for gross_roi: setting the dependent variable
    '''
y_roi = df_IMDbTop100['gross_roi']


    '''
    Step 2 for gross_roi: splitting data into train and test sets to seed the 
    estimation model
    '''
X_train, X_test, y_train_roi, y_test_roi = tts(X,y_roi, test_size = 0.2,
                                               random_state = 7)

 
    '''
    Step 3 for gross_roi: training the model
    '''
roi_model = XGBreg.fit(X_train, y_train_roi)

y_hat_roi = roi_model.predict(X_test)


    '''
    Step 4 for gross_roi: model performance evaluation
    '''  
print('RMSE:', MSE(y_test_roi, y_hat_roi, squared = False))

print('NRMSE:', (MSE(y_test_roi, y_hat_roi,
                     squared = False)/(y_roi.max()-y_roi.min())))

print('Coefficient of determination:', r2_score(y_test_roi, y_hat_roi))


        '''
        FINAL REMARKS
        
        From the above report, it was found that about 18% of the Rating could 
        be determined by the director of the movie, also that this model fails
        to find a linear relationship between the directors' influence with the
        Production Budget and Gross ROI, respectively.
        '''
# %%