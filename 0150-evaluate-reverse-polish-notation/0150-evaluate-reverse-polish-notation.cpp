class Solution {
public:
   public:
         int cal(int  num1 ,int num2, char &op)
        {
            switch (op)
            {

                case '+':
                    return num1 + num2;
                    break;

                case '-':
                    return num1 - num2;
                    break;

                case '*':
                    return num1 * num2;
                    break;

                case '/':
                    return num1 / num2;
                    break;
            }
            return 0;
        }
    int evalRPN(vector<string> &tokens)
    {
        stack<int> s;
        for (auto &i: tokens)
        {
            if (i == "-"
                or i == "+"
                or i == "*"
                or i == "/")
            {
                int a = s.top();
                s.pop();
                int b = s.top();
                s.pop();
                s.push(cal(b, a, i[0]));
            }
            else
            {
                s.push(stoi(i));
            }
        }
        return s.top();
    }
};