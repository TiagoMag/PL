%option noyywrap
%%

         	 char dest[90]; 
         	
\\mm     	 {printf("mesmo");}
\\prox   	 {printf("próxima");}
\\mt     	 {printf("muito");}
\\b    	     {printf("boa");}
\\exs    	 {printf("exercicios");}
\\pq     	 {printf("porque");}
\\sp     	 {printf("sempre");}
\\cqd        {printf("como se queria demonstrar");}
~[a-zA-Z]+   {sprintf(dest,"in%s",yytext+1);printf("%s",dest);}
[a-zA-Z]+\/  {yytext[strlen(yytext)-1] = '\0'; sprintf(dest,"%smente",yytext);printf("%s",dest);}
~[a-zA-Z]+\/ {yytext[strlen(yytext)-1] = '\0';sprintf(dest,"in%smente",yytext+1);printf("%s",dest);}

%%

int main(){
    yylex();
    return 0;
}

/*
Esta sessao foi \mm \mt \b.
na \prox nao quero \mm faltar, porque sera um sessao ainda melhor feliz/ que sei bem quanto e 4/5
todos os ~satisfeitos podem queixar-se dos \exs \pq sobria/ ninguem ira responder \cqd.
o ~= a nÃ£o Ã© para expandir
Mas ~feliz/ ha \sp casos \mt interessantes para nos dar luta!

~.+\/   {sprintf(dest2,"in%smente",yytext+1);printf("%s",dest);}
.+\/    {sprintf(dest,"%smente",yytext);printf("%s",dest);}
~.+     {sprintf(dest1,"in%s",yytext+1);printf("%s",dest);}
[a-zA-Z]+/\/ {sprintf(dest,"%smente",yytext);printf("%s",dest);}
~[a-zA-Z]+\/ {sprintf(dest,"in%smente",yytext+1);printf("%s",dest);}

flex ex.l ; gcc lex.yy.c ; ./a.out < abv.txt
*/
