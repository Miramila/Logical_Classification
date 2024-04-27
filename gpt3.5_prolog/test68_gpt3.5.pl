% Define the graduate students
graduate_student(zhang).
graduate_student(wang).
graduate_student(li).
graduate_student(zhao).
graduate_student(liu).
% Define the employers
employer(tianshu).
employer(tianji).
employer(tianxuan).
% Li was hired by Tianshu
hired(li, tianshu).
% Li and Zhao were not hired by the same unit
hired(li, Employer1), hired(zhao, Employer2), \+ Employer1 = Employer2.
% Liu and Zhao were hired by the same unit
hired(lu, Employer3), hired(zhao, Employer3).
% If Zhang was hired by Tianxuan, then Wang Ye was hired by Tianxuan
\+ hired(zhang, tianxuan) ; hired(wang, tianxuan).
% Query to check if Liu was hired by Tianxuan
hired(liu, tianxuan).
