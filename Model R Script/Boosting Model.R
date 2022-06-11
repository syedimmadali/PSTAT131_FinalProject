
# Cross validating the data with 5 folds.
control <- trainControl(method = "cv", 
                        number = 5)

# Fitting the Boosting model to the data set.
kfold_model_boosting <- train(blueWins ~., 
                              data = train, 
                              trControl = control, 
                              method = "gbm")

# Prints out the boosting model results.
print(kfold_model_boosting)



# Fitting
pred <- predict(kfold_model_boosting, newdata = test)
cm <- table(pred, test$blueWins)
confusionMatrix(cm)