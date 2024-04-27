% Define the graduate students and employers
graduate_student(zhang).
graduate_student(wang).
graduate_student(li).
graduate_student(zhao).
graduate_student(liu).
employer(tianshu).
employer(tianji).
employer(tianxuan).
% Li was hired by Tianshu
hired_by(li, tianshu).
% Li and Zhao were not hired by the same unit
hired_by(li, Unit), hired_by(zhao, Unit), li \= zhao.
% Liu and Zhao were hired by the same unit
hired_by(liu, Unit), hired_by(zhao, Unit), liu \= zhao.
% If Zhang was hired by Tianxuan, then Wang was hired by Tianxuan
hired_by(zhang, tianxuan) -> hired_by(wang, tianxuan).
% Define the answer options
answer(a) :- false.
answer(b) :- false.
answer(c) :- hired_by(liu, tianxuan), \+ (hired_by(zhang, tianxuan), \+ hired_by(wang, tianxuan)).
answer(d) :- false.
answer(e) :- false.
