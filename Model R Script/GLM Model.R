control <- trainControl(method = "cv", 
                        number = 5)

# Here I go ahead and train the model to use the GLM engine.
kfold_model_glm <- train(blueWins ~., 
                         data = train, 
                         trControl = control, 
                         method = "glm")

# Printing out the Logistic Regression model Results.
print(kfold_model_glm)



# Fitting

pred <- predict(kfold_model_glm, newdata = test)
cm <- table(pred, test$blueWins)

#Confusion matrix for my prediction.
confusionMatrix(cm)