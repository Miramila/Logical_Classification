% Define the graduate students and the employers
graduate_student(zhang).
graduate_student(wang).
graduate_student(li).
graduate_student(zhao).
graduate_student(liu).
employer(tianshu).
employer(tianji).
employer(tianxuan).
% Li was hired by Tianshu
hired(li, tianshu).
% Li and Zhao were not hired by the same unit
hired(li, Employer1), hired(zhao, Employer2), Employer1 \= Employer2.
% Liu and Zhao were hired by the same unit
hired(liu, Employer2), hired(zhao, Employer2).
% If Zhang was hired by Tianxuan, then Wang was hired by Tianxuan
hired(zhang, tianxuan) -> hired(wang, tianxuan).
% Check if Tianshu and Tianxuan employ the same number of people
same_number_of_employees :-
    findall(X, hired(X, tianshu), List1),
    findall(Y, hired(Y, tianxuan), List2),
    length(List1, Num1),
    length(List2, Num2),
    Num1 =:= Num2.
% Facts (assuming we have someone who meets the criteria for the answer)
hired(zhang, tianji).
hired(wang, tianxuan).
- Query to validate the answer:
