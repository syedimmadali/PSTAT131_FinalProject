# Cross validating the data with 5 folds.
control <- trainControl(method = "cv", number = 5)

# Tuning model based on metric, mtry
metric <- "Accuracy"
# I set mtry to 38, because we have 38 predictors
mtry <- 38
tunegrid <- expand.grid(.mtry=mtry)

# Fit the Random Forest model to the data.
rf_default <- train(blueWins~., data=train, method="rf", metric=metric, tuneGrid=tunegrid, trControl=control)

#prints out the RF model results.
print(rf_default)


# Fitting

pred <- predict(rf_default, newdata = test)
cm <- table(pred, test$blueWins)
confusionMatrix(cm)