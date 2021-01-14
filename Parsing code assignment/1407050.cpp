#include <bits/stdc++.h>

using namespace std;

int main()
{
    char terminal,non_terminal,start;
    string production;
    map< char,map<char,string> >a;
    int k=1;
    freopen("input.txt","r",stdin);
    while(k){
        cout<<"Enter non-terminal:"<<endl;
        cin>>non_terminal;
        cout<<"Enter terminal:"<<endl;
        cin>>terminal;
        cout<<"Enter production rule:"<<endl;
        cin>>production;
        a[non_terminal][terminal]=production;
        cout<<"Enter 0 for finish taking input or press 1 for taking input again:"<<endl;
        cin>>k;
        if(k==0)break;
    }
    cout<<"Enter the start symbol:"<<endl;
    cin>>start;
    string input_string;
    cout<<"Enter the input string:"<<endl;
    cin>>input_string;
    vector<char>stk;
    vector<char>in;
    for(int i=0;i<input_string.size();i++){
        in.push_back(input_string[i]);
    }


    in.push_back('$');
    stk.push_back('$');
    stk.push_back(start);

       cout<<"Current stack:"<<endl;
            for(int i=0;i<stk.size();i++){
                cout<<stk[i];
            }
            cout<<endl;
            cout<<"Current input elements:"<<endl;
            for(int i=0;i<in.size();i++){
                cout<<in[i];
            }
            cout<<endl;

    while(in.size()){
        char top=stk.back();
        char recent=in.front();
        if(top=='$' && recent=='$'){
            cout<<"Input Accepted"<<endl;
            stk.pop_back();
            in.erase(in.begin()+0);
            break;
        }

            else if(top==recent){
            stk.pop_back();
            in.erase(in.begin()+0);
            cout<<"Current stack:"<<endl;
            for(int i=0;i<stk.size();i++){
                cout<<stk[i];
            }
            cout<<endl;
            cout<<"Current input elements:"<<endl;
            for(int i=0;i<in.size();i++){
                cout<<in[i];
            }
            cout<<endl;

        }



        else if(!a[top][recent].empty() && a[top][recent]!="epsilon"){
            stk.pop_back();
            string tmp=a[top][recent];
            reverse(tmp.begin(),tmp.end());

            for(int j=0;j<tmp.size();j++){
               stk.push_back(tmp[j]);
            }
           cout<<"Current stack:"<<endl;
            for(int i=0;i<stk.size();i++){
                cout<<stk[i];
            }
            cout<<endl;
            cout<<"Current input elements:"<<endl;
            for(int i=0;i<in.size();i++){
                cout<<in[i];
            }
            cout<<endl;
            cout<<"Output :"<<top<<"-->"<<a[top][recent]<<endl;

        }
        else if(a[top][recent]=="epsilon"){
            stk.pop_back();
            cout<<"Current stack:"<<endl;
            for(int i=0;i<stk.size();i++){
                cout<<stk[i];
            }
            cout<<endl;
            cout<<"Current input elements:"<<endl;
            for(int i=0;i<in.size();i++){
                cout<<in[i];
            }
            cout<<endl;
            cout<<"Output :"<<top<<"-->"<<a[top][recent]<<endl;

        }


        else{
            cout<<"Input rejected"<<endl;
            break;
        }

    }


}
