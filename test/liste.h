#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include<malloc.h>

typedef struct ListElements * ListElts;            
typedef struct ListElements {
	char  nom[20]; 
 int taille ;
 int nature ;
ListElts suivant ;}  noeudE ;
                      
                         
                          
// creation d'un element
ListElts creer_cellule()  
{  ListElts  L= (ListElts)malloc(sizeof(noeudE)) ;

    
  return(L) ;
}

//ajout d'un element dans la liste 
ListElts ajout(ListElts L, char *c)
 { ListElts nouv=creer_cellule();
     ListElts p; 
     if(L==NULL) //creation en tete
   {  
   strcpy(nouv->nom, c);
   nouv->taille=strlen(c) ;
   nouv->suivant= L ;
   L=nouv ;
   }
   else
  { p=L;
   while(p->suivant!=NULL)
   {p=p->suivant;
   }
   if(p->suivant==NULL)
 {
  // nouv->nom =c ;
  strcpy(nouv->nom, c);
  nouv->taille= strlen(c) ;
  nouv->suivant=p->suivant ;
  p->suivant=nouv ;
  p=nouv ;
printf("L'element a ete inserer dans la liste\n\n");
 return L;
 }
  }
}
 
//recherche d'un element dans une liste 
void rechercheT(ListElts L, char *c1 )
{
         
         while(L != NULL && (strcmp(c1,L->nom)!=0) )  
        {   
          L=L->suivant;    }
  if (L!=NULL && (strcmp(c1,L->nom)==0)) 
{  printf("\nLe mot existe\n\n");}
  else 
  {printf("\nLe mot n'existe pas\n\n");
}}

//affichage d'une liste 
void  Affiche_liste(ListElts tete)
{       while(tete !=NULL) 
             {  printf("le nom est %s\n", tete->nom); 
                printf("la taille du nom est %d\n",tete->taille);
            
               tete=tete->suivant;    }
} 



