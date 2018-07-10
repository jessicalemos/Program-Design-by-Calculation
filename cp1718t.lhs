\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1718t}
\usepackage{subcaption}
\usepackage{adjustbox}
%================= lhs2tex=====================================================%
%include polycode.fmt
%format (div (x)(y)) = x "\div " y
%%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format for f i = "\mathsf{for}\ " f "\ " i
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format (cata (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2017/18
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex

\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 36
\\\hline
a82474 & Ana Ribeiro	
\\
a82061 & Jéssica Lemos	
\\
a82535 & Pedro Pinto
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm esta
disciplina, restringe-se a aplicação deste método à programação funcional
em \Haskell. Assim, 
o presente trabalho prático coloca os alunos perante problemas
concretos que deverão ser implementados em \Haskell.
Há ainda um outro objectivo: o de ensinar a documentar programas e
a produzir textos técnico-científicos de qualidade.

\section{Documentação}
Para cumprir de forma integrada os objectivos enunciados acima vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
\begin{quote}\em
Um programa e a sua documentação devem coincidir.
\end{quote}
Por outras palavras, o código fonte e a documentação de um programa deverão estar no
mesmo ficheiro.

O ficheiro \texttt{cp1718t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1718t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1718t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1718t.lhs > cp1718t.tex
    $ pdflatex cp1718t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1718t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1718t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable #-}
import Cp
import List  hiding (fac)
import Nat  
import Probability hiding (cond)
import BMP

import Data.List
import Data.Typeable
import Data.Ratio
import Data.Bifunctor
import Data.Maybe
import Data.Matrix hiding ((!))
import Test.QuickCheck hiding ((><),choose)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import GHC.IO.Exception
import Codec.Picture.Types
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1718t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1718t.aux
    $ makeindex cp1718t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell, a biblioteca
\href{https://hackage.haskell.org/package/JuicyPixels}{JuicyPixels} para processamento
de imagens e a biblioteca \href{http://gloss.ouroborus.net/}{gloss} para geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck JuicyPixels gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}

\section*{Problema 1}

Segundo uma \href{https://www.jn.pt/economia/interior/compra-diaria-de-bitcoins-iguala-acoes-da-apple-9257302.html}{notícia do Jornal de Notícias}, 
referente ao dia 12 de abril, \emph{``apenas numa hora, foram transacionadas 1.2 mil milhões de dólares em bitcoins. Nas últimas 24 horas, foram transacionados 8,5 mil milhões de dólares, num total de 24 mil milhões de dólares referentes às principais criptomoedas''}.

De facto, é inquestionável que as criptomoedas, e em particular as bitcoin, vieram para ficar.
%
Várias moedas digitais, e em particular as bitcoin, usam a tecnologia de block chain
para guardar e assegurar todas as transações relacionadas com a moeda.
%
Uma \href{https://en.bitcoin.it/wiki/Block_chain}{block chain} é uma coleção de blocos que registam os movimentos da moeda; a sua definição em Haskell é apresentada de seguida.

\begin{spec}
data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Block}{bloco} numa block chain
regista um número (mágico) único, o momento da execução, e uma lista de transações,
tal como no código seguinte:

\begin{spec}
type Block = (MagicNo, (Time, Transactions))
\end{spec}

Cada \href{https://en.bitcoin.it/wiki/Transaction}{transação} 
define a entidade de origem da transferência, o valor a ser transacionado,
e a entidade destino (por esta ordem), tal como se define de seguida.

\begin{spec}
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
\end{spec}

A partir de uma block chain, é possível calcular o valor que cada entidade
detém, tipicamente designado de ledger:

\begin{spec}
type Ledger = [(Entity, Value)]
\end{spec}

Seguem as restantes definições Haskell para completar o código anterior.
Note que |Time| representa o momento da transação, como o número de \href{https://currentmillis.com}{milisegundos} que passaram desde 1970.

\begin{spec}
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int
\end{spec}

Neste contexto, implemente as seguintes funções:

\begin{enumerate}
\item Defina a função |allTransactions :: Blockchain -> Transactions|, como um catamorfismo, que calcula a lista com todas as transações numa dada block chain.

%if False
\begin{code}
allTransactions :: Blockchain -> Transactions
prop1a :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    As transações de uma block chain são as mesmas da block chain revertida:
\begin{code}
prop1a = sort . allTransactions .==. sort . allTransactions . reverseChain
\end{code}

Note que a função |sort| é usada apenas para facilitar a comparação das listas.
\end{propriedade}

\item Defina a função |ledger :: Blockchain -> Ledger|, utilizando catamorfismos e/ou anamorfismos, que calcula o ledger (i.e., o valor disponível) de cada entidade numa uma dada block chain.
    Note que as entidades podem ter valores negativos; de facto isso acontecerá para a primeira transação que executarem.

%if False
\begin{code}
ledger :: Blockchain -> Ledger
prop1b :: Blockchain -> Bool
prop1c :: Blockchain -> Bool
\end{code}
%endif

\begin{propriedade}
    O tamanho do ledger é inferior ou igual a duas vezes o tamanho de todas as transações:
\begin{code}
prop1b = length . ledger .<=. (2*) . length . allTransactions
\end{code}
\end{propriedade}

\begin{propriedade}
    O ledger de uma block chain é igual ao ledger da sua inversa:
\begin{code}
prop1c = sort . ledger .==. sort . ledger . reverseChain
\end{code}
\end{propriedade}



\item Defina a função |isValidMagicNr :: Blockchain -> Bool|, utilizando catamorfismos e/ou anamorfismos, que verifica se todos os números mágicos numa dada block chain são únicos.

%if False
\begin{code}
isValidMagicNr :: Blockchain -> Bool
prop1d :: Blockchain -> Bool
prop1e :: Blockchain -> Property
\end{code}
%endif

\begin{propriedade}
    A concatenação de uma block chain com ela mesma nunca é válida em termos de números mágicos:
\begin{code}
prop1d = not . isValidMagicNr . concChain . (split id id)
\end{code}
\end{propriedade}

\begin{propriedade}
    Se uma block chain é válida em termos de números mágicos, então a sua inversa também o é:
\begin{code}
prop1e = isValidMagicNr .==>. isValidMagicNr . reverseChain
\end{code}
\end{propriedade}

\end{enumerate}



\section*{Problema 2}

Uma estrutura de dados frequentemente utilizada para representação e processamento de imagens de forma eficiente são as denominadas \href{https://en.wikipedia.org/wiki/Quadtree}{quadtrees}.
Uma \emph{quadtree} é uma árvore quaternária em que cada nodo tem quatro sub-árvores e cada folha representa um valor bi-dimensional.
\begin{spec}
data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
\end{spec}

\begin{figure}
\begin{subfigure}{0.3\textwidth}
\begin{verbatim}
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 0 0 0 0 )
( 0 0 0 0 1 1 1 0 )
( 0 0 0 0 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 1 1 0 0 )
( 1 1 1 1 0 0 0 0 )
( 1 1 1 1 0 0 0 1 )
\end{verbatim}
\caption{Matriz de exemplo |bm|.}
\label{fig:bm}
\end{subfigure}
\begin{subfigure}{0.7\textwidth}
\begin{verbatim}
Block
 (Cell 0 4 4) (Block
  (Cell 0 2 2) (Cell 0 2 2) (Cell 1 2 2) (Block
   (Cell 1 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1)))
 (Cell 1 4 4)
 (Block
  (Cell 1 2 2) (Cell 0 2 2) (Cell 0 2 2) (Block
   (Cell 0 1 1) (Cell 0 1 1) (Cell 0 1 1) (Cell 1 1 1)))
\end{verbatim}
\caption{Quadtree de exemplo |qt|.}
\label{fig:qt}
\end{subfigure}
\caption{Exemplos de representações de bitmaps.}
\end{figure}

Uma imagem monocromática em formato bitmap pode ser representada como uma
matriz de bits\footnote{Cf.\ módulo \href{https://hackage.haskell.org/package/matrix}{|Data.Matrix|}.},
tal como se exemplifica na Figura~\ref{fig:bm}.

O anamorfismo |bm2qt| converte um bitmap em forma matricial na sua codificação eficiente em quadtrees, e o catamorfismo |qt2bm| executa a operação inversa:

\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-1.5em
\rightskip\leftskip
\begin{code}
bm2qt :: (Eq a) => Matrix a -> QTree a
bm2qt = anaQTree f where
    f m = if one then i1 u else i2 (a,(b,(c,d)))
     where  x = (nub . toList) m
            u = (head x,(ncols m,nrows m))
            one = (ncols m == 1 || nrows m == 1 || length x == 1)
            (a,b,c,d) = splitBlocks (nrows m `div` 2) (ncols m `div` 2) m    
\end{code}
\endgroup
\end{minipage}} %
\adjustbox{valign=t}{\begin{minipage}{.5\textwidth} %
\begingroup
\leftskip-2em
\rightskip\leftskip
\begin{code}
qt2bm :: (Eq a) => QTree a -> Matrix a
qt2bm = cataQTree (either f g) where
    f (k,(i,j)) = matrix j i (const k)
    g (a,(b,(c,d))) = (a <|> b) <-> (c <|> d)
\end{code}
\endgroup
\end{minipage}}

O algoritmo |bm2qt| particiona recursivamente a imagem em $4$ blocos e termina produzindo folhas para matrizes unitárias ou quando todos os píxeis de um sub-bloco têm a mesma côr.
Para a matriz |bm| de exemplo, a quadtree correspondente |qt = bm2qt bm| é ilustrada na Figura~\ref{fig:qt}.

\begin{figure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person.png}
\caption{Bitmap de exemplo.}
\label{fig:person}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[height=0.2\linewidth]{cp1718t_media/person90.png}
\caption{Rotação.}
\label{fig:person90}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.4\linewidth]{cp1718t_media/personx2.png}
\caption{Redimensionamento.}
\label{fig:personx2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personinv.png}
\caption{Inversão de cores.}
\label{fig:personinv}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person1.png}
\caption{Compresão de $1$ nível.}
\label{fig:person1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person2.png}
\caption{Compresão de $2$ níveis.}
\label{fig:person2}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person3.png}
\caption{Compresão de $3$ níveis.}
\label{fig:person3}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/person4.png}
\caption{Compresão de $4$ níveis.}
\label{fig:person4}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut1.png}
\caption{Bitmap de contorno.}
\label{fig:personOut1}
\end{subfigure}
%
\begin{subfigure}{0.5\textwidth}
\centering
\includegraphics[width=0.2\linewidth]{cp1718t_media/personOut2.png}
\caption{Bitmap com contorno.}
\label{fig:personOut2}
\end{subfigure}
%
\caption{Manipulação de uma figura bitmap utilizando quadtrees.}
\end{figure}

Imagens a cores podem ser representadas como matrizes de píxeis segundo o código de cores \href{https://en.wikipedia.org/wiki/RGBA_color_space}{RGBA}, codificado no tipo \href{https://hackage.haskell.org/package/JuicyPixels-3.2.9.5/docs/Codec-Picture.html#t:PixelRGBA8}{|PixelRGBA8|} em que cada pixel é um quádruplo de valores inteiros $(red,green,blue,alpha)$ contidos entre $0$ e $255$.
Atente em alguns exemplos de cores:
\begin{spec}
whitePx  = PixelRGBA8 255 255 255 255
blackPx  = PixelRGBA8 0 0 0 255
redPx    = PixelRGBA8 255 0 0 255
\end{spec}

O módulo |BMP|, disponibilizado juntamente com o enunciado, fornece funções para processar ficheiros de imagem bitmap como matrizes:
\begin{spec}
    readBMP :: FilePath -> IO (Matrix PixelRGBA8)
    writeBMP :: FilePath -> Matrix PixelRGBA8 -> IO ()
\end{spec}

Teste, por exemplo, no |GHCi|, carregar a Figura~\ref{fig:person}:
\begin{verbatim}
    > readBMP "cp1718t_media/person.bmp"
\end{verbatim} 

Esta questão aborda operações de processamento de imagens utilizando quadtrees:
\begin{enumerate}
    \item Defina as funções |rotateQTree :: QTree a -> QTree a|, |scaleQTree :: Int -> QTree a -> QTree a| e |invertQTree :: QTree a -> QTree a|, como catamorfismos e/ou anamorfismos, que rodam\footnote{Segundo um ângulo de $90º$ no sentido dos ponteiros do relógio.}, redimensionam \footnote{Multiplicando o seu tamanho pelo valor recebido.} e invertem as cores de uma quadtree\footnote{Um pixel pode ser invertido calculando $255 - c$ para cada componente $c$ de cor RGB, exceptuando o componente alpha.}, respectivamente.
    Tente produzir imagens similares às Figuras~\ref{fig:person90}, \ref{fig:personx2} e \ref{fig:personinv}:
%if False
\begin{code}
rotateQTree :: QTree a -> QTree a
scaleQTree :: Int -> QTree a -> QTree a
invertQTree :: QTree PixelRGBA8 -> QTree PixelRGBA8
prop2c :: QTree Int -> Bool
prop2d :: Nat -> QTree Int -> Bool
prop2e :: QTree PixelRGBA8 -> Bool
\end{code}
%endif
        \begin{verbatim}
    > rotateBMP  "cp1718t_media/person.bmp" "person90.bmp"
    > scaleBMP 2 "cp1718t_media/person.bmp" "personx2.bmp"
    > invertBMP  "cp1718t_media/person.bmp" "personinv.bmp"
        \end{verbatim}

\begin{propriedade}
        Rodar uma quadtree é equivalente a rodar a matriz correspondente:
\begin{code}
prop2c = rotateMatrix . qt2bm .==. qt2bm . rotateQTree
\end{code}
    \end{propriedade}
\begin{propriedade}
    Redimensionar uma imagem altera o seu tamanho na mesma proporção:
\begin{code}
prop2d (Nat s) = sizeQTree . scaleQTree s .==. ((s*) >< (s*)) . sizeQTree
\end{code}
\end{propriedade}
\begin{propriedade}
    Inverter as cores de uma quadtree preserva a sua estrutura:
\begin{code}
prop2e = shapeQTree . invertQTree .==. shapeQTree
\end{code}
\end{propriedade}
    
    \item Defina a função |compressQTree :: Int -> QTree a -> QTree a|, utilizando catamorfismos e/ou anamorfismos, que comprime uma quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis.
    Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:person1}, \ref{fig:person2}, \ref{fig:person3} e \ref{fig:person4}:
%if False
\begin{code}
compressQTree :: Int -> QTree a -> QTree a
prop2f :: Nat -> QTree Int -> Bool
\end{code}
%endif
        \begin{verbatim}
    > compressBMP 1 "cp1718t_media/person.bmp" "person1.bmp"
    > compressBMP 2 "cp1718t_media/person.bmp" "person2.bmp"
    > compressBMP 3 "cp1718t_media/person.bmp" "person3.bmp"
    > compressBMP 4 "cp1718t_media/person.bmp" "person4.bmp"
        \end{verbatim}
    \begin{propriedade}
        A quadtree comprimida tem profundidade igual à da quadtree original menos a taxa de compressão:
\begin{code}
prop2f (Nat n) = depthQTree . compressQTree n .==. (`minusNat` n) . depthQTree
\end{code}
    \end{propriedade}
    

    \item Defina a função |outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool|, utilizando catamorfismos e/ou anamorfismos, que recebe uma função que determina quais os píxeis de fundo e converte uma quadtree numa matriz monocromática, de forma a desenhar o contorno de uma \href{https://en.wikipedia.org/wiki/Polygon_mesh}{malha poligonal} contida na imagem.
        Tente produzir imagens similares (mas não necessariamente iguais) às Figuras~\ref{fig:personOut1} e \ref{fig:personOut2}:
%if False
\begin{code}
outlineQTree :: (a -> Bool) -> QTree a -> Matrix Bool
\end{code}
%endif
            \begin{verbatim}
    > outlineBMP    "cp1718t_media/person.bmp" "personOut1.bmp"
    > addOutlineBMP "cp1718t_media/person.bmp" "personOut2.bmp"
            \end{verbatim}
%if False
\begin{code}
prop2g :: QTree Int -> Bool
\end{code}
%endif
    \begin{propriedade}
        A matriz de contorno tem dimensões iguais às da quadtree:
\begin{code}
prop2g = sizeQTree .==. sizeMatrix . outlineQTree (<0)
\end{code}
    \end{propriedade}
    \begin{teste}
        Contorno da quadtree de exemplo |qt|:
\begin{code}
teste2a = outlineQTree (==0) qt == qtOut 
\end{code}
    \end{teste}

\end{enumerate}

\section*{Problema 3}
O cálculo das combinações de |n| |k|-a-|k|,
\begin{eqnarray}
	|bin n k = frac (fac n)(fac k * (fac ((n-k))))|
	\label{eq:bin} 
\end{eqnarray}
envolve três factoriais. Recorrendo à \material{lei de recursividade múltipla} do cálculo
de programas, é possível escrever o mesmo programa como um simples ciclo-for
onde se fazem apenas multiplicações e somas. Para isso, começa-se por estruturar
a definição dada da forma seguinte,
\begin{eqnarray*}
	|bin n k = h k (n - k)|
\end{eqnarray*}
onde
\begin{eqnarray*}
\start
       |h k d = frac (f k d) (g d)|
\more
       |f k d = frac (fac ((d+k))) (fac k)|
\more
       |g d = fac d| 
\end{eqnarray*}
assumindo-se |d = n-k >=0|.
%
É fácil de ver que |f k| e |g| se desdobram em 4 funções mutuamente recursivas, a saber
\begin{spec}
f k 0 = 1
f k (d+1) = underbrace ((d+k+1)) (l k d) * f k d

l k 0 = k+1
l k (d+1) = l k d + 1
\end{spec}
e 
\begin{spec}
g 0 = 1
g (d+1) = underbrace ((d+1)) (s d) * g d

s 0 = 1
s (d+1) = s n + 1
\end{spec}
A partir daqui alguém derivou a seguinte implementação:
\begin{code}
bin n k = h k (n-k) where  h k n = let (a,_,b,_) = for loop (base k) n in a % b
\end{code}
Aplicando a lei da recursividade múltipla para |split (f k) (l k)| e para
|split g s| e combinando os resultados com a \material{lei de banana-split},
derive as funções |base k| e |loop| que são usadas como auxiliares acima.

\begin{propriedade}
Verificação que |bin n k| coincide com a sua especificação (\ref{eq:bin}):
\begin{code}
prop3 (NonNegative n) (NonNegative k) = k <= n ==> (bin n k) == (fac n) % (fac k * (fac ((n-k))))
\end{code}
\end{propriedade}

\section*{Problema 4}

\begin{figure}
\begin{center}
\includegraphics[width=0.7\textwidth]{cp1718t_media/pythagoras-tree1.png}
\end{center}
\caption{Passos de construção de uma árvore de Pitágoras de ordem $3$.}
\label{fig:pitagoras1}
\end{figure}

\href{https://en.wikipedia.org/wiki/Fractal}{Fractais} são formas geométricas que podem ser construídas recursivamente de acordo com um conjunto de equações matemáticas.
Um exemplo clássico de um fractal são as \href{https://en.wikipedia.org/wiki/Pythagoras_tree_(fractal)}{árvores de Pitágoras}.
A construção de uma árvore de Pitágoras começa com um quadrado, ao qual se unem dois quadrados redimensionados pela escala $\sqrt{2}/2$, de forma a que os cantos dos $3$ quadrados coincidam e formem um triângulo rectângulo isósceles.
Este procedimento é repetido recursivamente de acordo com uma dada ordem, definida como um número natural (Figura~\ref{fig:pitagoras1}).

Uma árvore de Pitágoras pode ser codificada em Haskell como uma full tree contendo quadrados nos nodos e nas folhas, sendo um quadrado definido simplesmente pelo tamanho do seu lado:
\begin{spec}
data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float
\end{spec}

\begin{enumerate}
    \item Defina a função |generatePTree :: Int -> PTree|, como um anamorfismo, que gera uma árvore de Pitágoras para uma dada ordem.

%if False
\begin{code}
generatePTree :: Int -> PTree
prop4a :: SmallNat -> Bool
prop4b :: SmallNat -> Bool
\end{code}
%endif

\begin{propriedade}
    Uma árvore de Pitágoras tem profundidade igual à sua ordem:
\begin{code}
prop4a (SmallNat n) = (depthFTree . generatePTree) n == n
\end{code}
\end{propriedade}
\begin{propriedade}
    Uma árvore de Pitágoras está sempre balanceada:
\begin{code}
prop4b (SmallNat n) = (isBalancedFTree . generatePTree) n
\end{code}
\end{propriedade}

\item Defina a função |drawPTree :: PTree -> [Picture]|, utilizando catamorfismos e/ou anamorfismos, que anima incrementalmente os passos de construção de uma árvore de Pitágoras recorrendo à biblioteca \href{https://hackage.haskell.org/package/gloss}{gloss}.
    Anime a sua solução:
\begin{verbatim}
    > animatePTree 3
\end{verbatim}

%if False
\begin{code}
drawPTree :: PTree -> [Picture]

window = (InWindow "CP" (800,800) (0,0))
square s = rectangleSolid s s

animatePTree n = animate window white draw
    where
    pics = drawPTree (generatePTree n)
    draw t = pics !! (floor (t/2))
\end{code}
%endif
    
\end{enumerate}

\section*{Problema 5}

Uma das áreas em maior expansão no campo da informática é a análise de dados
e  \href{https://www.mathworks.com/discovery/machine-learning.html}{machine learning}. Esta questão aborda um \emph{mónade} que ajuda
a fazer, de forma simples, as operações básicas dessas técnicas. Esse mónade
é conhecido por \emph{bag}, \emph{saco} ou \emph{multi-conjunto}, permitindo
que os elementos de um conjunto tenham multiplicidades associadas. Por exemplo,
seja
\begin{code}
data Marble = Red | Pink | Green | Blue | White deriving (Read,Show,Eq,Ord)
\end{code}
um tipo dado.\footnote{``Marble" traduz para ``berlinde" em português.}
A lista |[ Pink,Green,Red,Blue,Green,Red,Green,Pink,Blue,White ]| tem elementos
repetidos. Assumindo que a ordem não é importante, essa lista corresponde ao saco
\begin{quote}\small
\begin{verbatim}
{ Red |-> 2 , Pink |-> 2 , Green |-> 3 , Blue |-> 2 , White |-> 1 }
\end{verbatim}
\end{quote}
que habita o tipo genérico dos ``bags":
\begin{code}
data Bag a = B [(a,Int)] deriving (Ord)
\end{code}
O mónade que vamos construir sobre este tipo de dados faz a gestão automática das multiciplidades.
Por exemplo, seja dada a função que dá o peso de cada berlinde em gramas:
\begin{code}
marbleWeight :: Marble -> Int
marbleWeight Red   = 3
marbleWeight Pink  = 2
marbleWeight Green = 3
marbleWeight Blue  = 6
marbleWeight White = 2
\end{code}
Então, se quisermos saber quantos \emph{berlindes} temos, de cada \emph{peso}, não teremos que fazer contas:
basta calcular
\begin{code}
marbleWeights = fmap marbleWeight bagOfMarbles
\end{code}
onde |bagOfMarbles| é o saco de berlindes referido acima, obtendo-se:
\begin{quote}\small
	\verb!{ 2 |-> 3 , 3 |-> 5 , 6 |-> 2 }!.
\end{quote}
%
Mais ainda, se quisermos saber o total de berlindes em |bagOfMarbles| basta
calcular |fmap (!) bagOfMarbles| obtendo-se \verb!{ () |-> 10 }!; isto é,
o saco tem |10| berlindes no total.


Finalmente, se quisermos saber a probabilidade da cor de um berlinde que tiremos do saco, basta converter
o referido saco numa distribuição correndo:
\begin{code}
marblesDist = dist bagOfMarbles
\end{code}
obtendo-se a distribuição (graças ao módulo \Probability):
\begin{quote}\small
\begin{verbatim}
Green  30.0%
  Red  20.0%
 Pink  20.0%
 Blue  20.0%
White  10.0%
\end{verbatim}
\end{quote}
cf.\ Figura \ref{fig:dist}.

\begin{figure}
\begin{center}
\includegraphics[width=0.4\textwidth]{cp1718t_media/marblesDist-mod5.png}
\end{center}
\caption{Distribuição de berlindes num saco.}
\label{fig:dist}
\end{figure}

Partindo da seguinte declaração de |Bag| como um functor e como um mónade,
\begin{code}
instance Functor Bag where
    fmap f = B. map (f><id) . unB

instance Monad Bag where
   x >>= f = (muB.fmap f) x where
   return = singletonbag
\end{code}
\begin{enumerate}
\item	
Defina a função |muB| (multiplicação do mónade |Bag|) e a função auxiliar
|singletonbag|.
\item	Verifique-as com os seguintes testes unitários:
%if False
\begin{code}
muB :: Bag (Bag a) -> Bag a
\end{code}
%endif
\begin{teste}
Lei |muB.return=id|:
\begin{code}
test5a = bagOfMarbles == muB (return bagOfMarbles)
\end{code}
\end{teste}
\begin{teste}
Lei |muB.muB = muB . fmap muB|:
\begin{code}
test5b = (muB . muB) b3 == (muB .fmap muB) b3
\end{code}
\vskip 1em
onde |b3| é um saco dado em anexo.
\end{teste}
\end{enumerate}

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1718t}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Mónade para probabilidades e estatística}\label{sec:Dist}
%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de |0| a |100%|.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam |100%|.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}

Este mónade é adequado à resolução de problemas de \emph{probabilidades e
estatística} usando programação funcional, de forma elegante e como caso
particular de programação monádica.

\section{Definições auxiliares}\label{sec:helper_functions}
Funções para mostrar \emph{bags}:
\begin{code}
instance (Show a, Ord a, Eq a) => Show (Bag a) where
    show = showbag . consol . unB  where
       showbag = concat .
                 (++ [" }"]) .  ("{ ":) . 
                 (intersperse " , ") .
                 sort . 
                 (map f) where f(a,b) = (show a) ++ " |-> " ++ (show b)
unB (B x) = x
\end{code}
Igualdade de \emph{bags}:
\begin{code}
instance (Eq a) => Eq (Bag a) where
   b == b' = (unB b) `lequal` (unB b')
           where lequal a b = isempty (a `ominus` b)
                 ominus a b = a ++ neg b
                 neg x = [(k,-i) | (k,i) <- x]
\end{code}
Ainda sobre o mónade |Bag|:
\begin{code}
instance Applicative Bag where
    pure = return
    (<*>) = aap
\end{code}
O exemplo do texto:
\begin{code}
bagOfMarbles = B [(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)]
\end{code}
Um valor para teste (bags de bags de bags):
\begin{code}
b3 :: Bag (Bag (Bag Marble))
b3= B [(B [(B[(Pink,2),(Green,3),(Red,2),(Blue,2),(White,1)],5)
      ,(B [(Pink,1),(Green,2),(Red,1),(Blue,1)],2)],2)]
\end{code}
Outras funções auxiliares:
\begin{code}
a |-> b = (a,b)

consol :: (Eq b) => [(b, Int)] -> [(b, Int)]
consol = filter nzero . map (id >< sum) . col where nzero(_,x)=x/=0

isempty :: Eq a => [(a, Int)] -> Bool
isempty = all (==0) . map snd . consol

col x = nub [ k |-> [ d' | (k',d') <- x , k'==k ] | (k,d) <- x ]

consolidate :: Eq a => Bag a -> Bag a
consolidate = B . consol . unB

\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o ``layout'' que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e / ou 
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

\begin{code}
inBlockchain = either (Bc) (Bcs)
outBlockchain (Bc bc) = Left(bc)
outBlockchain (Bcs (a,b)) = Right (a,b)
recBlockchain f = id -|- id >< f    
cataBlockchain g = g . (recBlockchain(cataBlockchain g)) . outBlockchain  
anaBlockchain g = inBlockchain . (recBlockchain(anaBlockchain g)) . g 
hyloBlockchain f g = cataBlockchain f . anaBlockchain g 
\end{code}

\par{Começamos por escrever em Haskell a função que devolve a lista com todas as transações numa dada block chain e de seguida aplicamos as Leis do Cálculo funcional de modo a obtermos o catamorfismo.}

\begin{eqnarray*}
\start
|lcbr(allTransactions (Bc (a,(b,c))) = c)(allTransactions (Bcs ((a,(b,c)),d)) = c ++ allTransactions d)|
%
\just\equiv{Igualdade Extensional, Def-comp}
%
|lcbr(allTransactions . Bc = p2.p2)(allTransactions . Bcs = p2.p2.p1 ++ allTransactions.p2)|
%
\just\equiv{Definição conc, Def-split}
%
|lcbr(allTransactions . Bc = p2.p2)(allTransactions . Bcs = conc.(split (p2.p2.p1) (allTransactions.p2)))|
%
\just\equiv{Def-x}
%
|lcbr(allTransactions . Bc = p2.p2)(allTransactions . Bcs = conc.(p2.p2 >< allTransactions))|
%
\just\equiv{Functor-x, Natural-id}
%
|lcbr(allTransactions . Bc = p2.p2)(allTransactions . Bcs = conc.((p2.p2 >< id) . (id >< allTransactions)))|
%
\just\equiv{Eq-+}
%
|either(allTransactions . Bc) (allTransactions . Bcs) = either(p2.p2) (conc.((p2.p2 >< id) . (id ><allTransactions)))|
%
\just\equiv{Fusao-+, Natural-id}
%
|allTransactions . either(Bc) (Bcs) = either(p2.p2.id) (conc.((p2.p2 >< id).(id >< allTransactions))) |
%
\just\equiv{Absorção-+}
%
|allTransactions . either(Bc) (Bcs) = either(p2.p2) (conc . (p2.p2 >< id)) . (id+(id >< allTransactions))|
%
\just\equiv{Universal-cata}
%
|allTransactions = cataBlockchain(either(p2.p2) (conc.(p2.p2><id)))|
\end{eqnarray*}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
      \ar[d]_-{|allTransactions|}
&
    |Block + Block >< Blockchain|
      \ar[d]^{|id + id >< allTransactions|}
      \ar[l]_-{|inBlockchain|}
\\
     |Transactions|
&
     |Block + Block >< Transactions|
      \ar[l]^-{f}
}
\end{eqnarray*}

\par{Desta forma, o catamorfismo obtido é:}

\begin{code}
allTransactions = cataBlockchain(either (p2.p2) (conc.(p2.p2 >< id)))
\end{code}

\par{Para a resolução da função \textit{ledger} foi necessário recorrer a duas funções auxiliares. A \textit{insere} que atualiza o valor disponível de uma entidade e caso esta não se encontre na lista em que as entidades estão associadas ao seu valor disponível, insere-a. E a função \textit{ledgerAux} responsável por gerir as transações, ou seja, indica a cada entidade o montante da transação. }

\begin{code}
insere :: Ledger -> Entity -> Value -> Ledger
insere [] entity value = [(entity,value)]
insere ((h,y):t) entity value = if (h==entity) then (h,(y+value)):t else (h,y):insere t entity value
\end{code}
\begin{code}
ledgerAux :: Transactions -> Ledger
ledgerAux [] = []
ledgerAux ((a,(h,c)):t) = insere (insere (ledgerAux t) a (h)) c h
\end{code}

\par{Deste modo, a função em Haskell que permite calcular o valor disponível numa dada block chain é a seguinte:}

\begin{eqnarray*}
\start
%
|lcbr(ledger (Bc (a,(b,c))) = ledgerAux c)(ledger (Bcs ((a,(b,c)),d)) = ledgerAux c ++ ledger d)|
%
\just\equiv{ Igualdade Extensional, Def-comp }
%
|lcbr(ledger . Bc = lerdgerAux.p2.p2 )(ledger . Bcs = ledgerAux.p2.p2.p1 ++ ledger.p2)|
%
\just\equiv{Definição conc, Def-split}
%
|lcbr(ledger . Bc = p2.p2)(ledger . Bcs = conc.(split (ledgerAux.p2.p2.p1) (ledger.p2)))|
%
\just\equiv{Def-x}
%
|lcbr(ledger . Bc = p2.p2)(ledger . Bcs = conc.(ledgerAux.p2.p2 >< ledger))|
%
\just\equiv{Functor-x, Natural-id}
%
|lcbr(ledger . Bc = p2.p2)(ledger . Bcs = conc.((ledgerAux.p2.p2 >< id) . (id >< ledger)))|
%
\just\equiv{Eq-+}
%
|either(ledger . Bc) (ledger . Bcs) = either(ledgerAux.p2.p2) (conc.((ledgerAux.p2.p2 >< id) . (id ><ledger)))|
%
\just\equiv{Fusão-+, Natural-id}
%
|ledger . either(Bc) (Bcs) = either(ledgerAux.p2.p2.id) (conc.((ledgerAux.p2.p2 >< id).(id >< ledger))) |
%
\just\equiv{Absorção-+}
%
|ledger . either(Bc) (Bcs) = either(ledgerAux.p2.p2) (conc . (ledgerAux.p2.p2 >< id)) . (id+(id >< ledger))|
%
\just\equiv{Universal-cata}
%
|ledger = cataBlockchain(either(ledgerAux.p2.p2) (conc.(ledgerAux.p2.p2><id)))|
\end{eqnarray*}

\par{Através dos Leis do Cálculo Funcional, obtemos o catamorfismo que calcula o ledger, valor disponível de cada entidade numa dada block chain: }

\begin{code}
ledger = cataBlockchain(either (ledgerAux.p2.p2) (conc.((ledgerAux.p2.p2) >< id)))
\end{code}

\par{Para desenvolver a função \textit{isValidMagicNr} tornou-se imperativo implementar a função auxiliar \textit{nMag} que guarda numa lista todos os números mágicos existentes numa block chain.}

\begin{eqnarray*}
\start
%
|lcbr(nMag Bc (a,(x,y)) = [a]) (nMag Bcs ((a,(x,y)),b) = [a] ++ nMag b)|
%
\just\equiv{Def-comp, Igualdade extensional, definição conc e singl, Def-x}
%
|lcbr(nMag.Bc = singl.p1) (nMag.Bcs = conc.(singl.p1 >< nMag))|
%
\just\equiv{Eq-+, Fusão-+}
%
|nMag. (either (Bc) (Bcs)) = either (singl.p1) (conc.(singl.p1 >< nMag))|
%
\just\equiv{Functor-x, Natural-id}
%
|nMag. (either (Bc) (Bcs)) = either (singl.p1) (conc.(singl.p1>< id . id><nMag))|
%
\just\equiv{Absorção-+}
%
|nMag. (either (Bc) (Bcs)) = (either (singl.p1) (conc. (singl.p1>< id))) . (id+id><nMag)|
%
\just\equiv{Universal-cata}
%
|nMag = cataBlockchain(either (singl.p1) (conc.(singl.p1><id)))|
%
\end{eqnarray*}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Blockchain|
      \ar[d]_-{|nMags|}
&
    |Block + Block >< Blockchain|
      \ar[d]^{|id + id >< nMags|}
      \ar[l]_-{|inBlockchain|}
\\
     |[MagicNo]|
&
     |Block + Block >< [MagicNo]|
      \ar[l]^-{f}
}
\end{eqnarray*}

\par{Pelos Leis do Cálculo Funcional, chegamos ao seguinte catamorfismo:}
\begin{code}
nMag = cataBlockchain(either (singl.p1) (conc.(singl.p1><id)))
\end{code}

\par{Foi ainda necessário elaborar uma função, \textit{isValidAux}, que associasse a um determinado número mágico os seguintes números mágicos presentes na block chain. Assim, criamos uma lista de túplos em que o primeiro elemento representa o número mágico e o segundo uma lista com os seguintes.}

\begin{eqnarray*}
\start
%
|lcbr(isValidAux [] = []) (isValidAux (h:t) = (h,t) : isValidAux t)|
%
\just\equiv{Definição nil e cons, Def-comp, Igualdade Extensional, Def-split}
%
|lcbr(isValidAux.nil = nil) (isValidAux.cons = cons.split (id) (isValidAux.p2))|
%
\just\equiv{Eq-+, Absorção-+, Fusão-+, Natural-id}
%
|isValidAux.either (nil) (cons) = (either (nil) (cons)) . (id + split (id) (isValidAux.p2))|
%
\just\equiv{Definição inList, Functor-+, Absorção-x}
%
|isValidAux . inList = inList . (id + id >< isValidAux) . (id + split (id) (p2)) |
%
\just\equiv{Isomorfismo outList = inList, F f = id + id >< f}
%
|outList. isValidAux  =  (F isValidAux) . (id + split (id) (p2)) . outList |
%
\just\equiv{Universal-ana}
%
|isValidAux = anaList ((id + split (id) (p2)) . outList)|
%
\end{eqnarray*}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |[MagicNo]|
      \ar[d]_-{|isValidAux|}
&
    |1 + (MagicNo >< [MagicNo]) >< [MagicNo]|
      \ar[d]^{|id + id >< isValidAux|}
      \ar[l]_-{f}
\\
     |[MagicNo><[MagicNo]]|
&
     |1 + (MagicNo><[MagicNo]) >< [MagicNo >< [MagicNo]] |
      \ar[l]^-{|inList|}
}
\end{eqnarray*}

\par{A \textit{isValidMagicNr} verifica se nenhum dos números mágicos é repetido para tal, averiguamos se nenhum dos primeiros elementos dos túplos se encontra na lista associada. Desta forma, recorremos ao anamorfismo de listas obtido da \textit{isValidAux} que será aplicado à lista dos números mágicos proveniente da \textit{nMag}.}
\begin{code}
isValidMagicNr = (all elemMag) . (anaList ((id -|- (split id p2)) . outList)) . nMag
                     where elemMag = uncurry notElem
\end{code}

\subsection*{Problema 2}

\begin{code}
uncurryQTree f = \(x,(y,(z,w))) -> f x y z w
uncurryQTree2 f = \(x,(z,w)) -> f x z w
inQTree = either (uncurryQTree2 Cell) (uncurryQTree Block)
outQTree (Cell a b c) = Left (a,(b,c))  
outQTree (Block a b c d) = Right(a,(b,(c,d)))
baseQTree f g = (f >< id) -|- (g >< (g  >< (g >< g)))
recQTree f = baseQTree id f
cataQTree g = g . (recQTree (cataQTree g)) . outQTree
anaQTree f = inQTree . (recQTree (anaQTree f) ) . f
hyloQTree f g = cataQTree f . anaQTree g
instance Functor QTree where
    fmap g = cataQTree (inQTree . baseQTree g id)
\end{code}

\par{Para obtermos o anamorfismo da \textit{rotateQTree} que permite rodar uma \textit{quadtree} partimos da seguinte função em Haskell:}
\begin{eqnarray*}
\start
%
|lcbr(rotateQTree (Cell a b c) = (Cell a c b)) (rotateQTree (Block a b c d) = (Block c a d b))|
%
\just\equiv{Def-comp, Def-split, Igualdade Extencional, Absorção-x, definição swap}
%
|lcbr(rotateQTree.Cell = Cell.(id><swap)) (rotateQTree.Block = Block.rotateQTree^4.(split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2)))))|
%
\just\equiv{Eq-+, Fusão-+, Definição inQTree}
%
|rotateQTree.inQTree = either (Cell.(id><swap)) (Block.rotateQTree^4.(split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2)))))|
%
\just\equiv{Definição inQTree, Absorção-+}
%
|rotateQTree.inQTree = inQTree . (id><swap)  + rotateQTree^4.(split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2))))|
%
\just\equiv{Definição |F rotateQTree = id >< id + rotateQTree^4|, Functor-+, Functor-x, Natural-id}
%
|rotateQTree.inQTree = inQTree . F rotateQTree . ((id>< swap) + split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2))))|
%
\just\equiv{Isomorfismo outQTree = inQTree}
%
|outQTree.rotateQTree = F rotateQTree.(id>< swap + split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2)))). outQTree|
%
\just\equiv{Universal-ana}
%
|rotateQTree = anaQTree ((id>< swap + split (p1.p2.p2) (split (p1) (split(p2.p2.p2) (p1.p2)))). outQTree)|
%
\end{eqnarray*}

\par{Pelas Leis do Cálculo Funcional foi possível representar a função pelo seguinte anamorfismo:}
\begin{code}
rotateQTree = anaQTree(( id><swap -|- (split (fst . snd . snd) (split fst (split (snd . snd . snd) (fst . snd))))).outQTree)
\end{code}

\par{Aplicamos as Leis do Cálculo Funcional a esta função em Haskell que permite redimensonar uma \textit{quadtree}, isto é, multiplica o seu tamanho pelo valor recebido.}

\begin{eqnarray*}
\start
%
|lcbr(scaleQTree s (Cell a b c) = (Cell a (s*b) (s*c) )) (scaleQTree s (Block a b c d) = Block (scaleQtree a) (scaleQTree b) (scaleQTree c) (scaleQTree d))|
%
\just\equiv{Def-comp, Igualdade Extencional, Def-x}
%
|lcbr(scaleQTree s . Cell = Cell.(id><(*s)><(*s))) (scaleQTree s. Block = Block.scaleQTree^4)|
%
\just\equiv{Eq-+, Fusão-+, Definição inQTree}
%
|scaleQTree s.inQTree = either (Cell.(id><(*s)><(*s))) (Block.scaleQTree^4)|
%
\just\equiv{Definição inQTree, Absorção-+}
%
|scaleQTree s.inQTree = inQTree.((id><(*s)><(*s))+ scaleQTree^4)|
%
\just\equiv{Definição |F scaleQTree = id >< id + scaleQTree^4|, Functor-+, Functor-x}
%
|scaleQTree s.inQTree = inQTree.F scaleQTree . (id><(*s)><(*s) + id)|
%
\just\equiv{Isomorfismo outQTree = inQTree}
%
|outQTree.scaleQTree s = F scaleQTree . (id><(*s)><(*s) + id) . outQTree|
%
\just\equiv{Universal-ana}
%
|scaleQTree s = anaQTree((id><(*s)><(*s) + id) . outQTree)|
%
\end{eqnarray*}
\par{Deste modo obtemos o anamorfismo:}
\begin{code}
scaleQTree s = anaQTree(((id >< ((*s) >< (*s))) -|- id) . outQTree)
\end{code}

\par{Para obtermos o catamorfismo da invertQTree, que inverte as cores de uma quadtree, aplicamos a função \textit{invertP} que inverte cada \textit{pixel}.}
\begin{code}
invertP (PixelRGBA8 a b c d) = PixelRGBA8 (255-a) (255-b) (255-c) d
invertQTree = fmap invertP
\end{code}
\par{A função \textit{compressQTree} pretende comprimir a quadtree cortando folhas da árvore para reduzir a sua profundidade num dado número de níveis. Para tal, começamos por calcular o número de níveis que a quadtree deverá ter de modo a no último nível aplicarmos o método de substituição elaborado. }
\begin{code}
compressQTree n tree = compressAux ((depthQTree tree) - n) tree
compressAux n (Cell a b c) = Cell a b c
compressAux n (Block a b c d) =
    if (n > 1) then Block (r (n-1) a) (r (n-1) b) (r (n-1) c) (r (n-1) d)
    else Cell (getF a) (sumX(Block a b c d)) (sumY(Block a b c d))
        where r = compressAux

getF (Cell a b c) = a
getF (Block a b c d) = getF a
sumX (Cell a b c) = b
sumX (Block a b c d) = sumX a + sumX b
sumY (Cell a b c) = c
sumY (Block a b c d) = sumY a + sumY c
\end{code}

\par{Função, auxiliar da \textit{outlineQTree}, que verifica e altera as células da quadtree tendo em conta se estas são de fundo.}
\begin{eqnarray*}
\start
%
|lcbr(outAux p Cell(a,(b,c)) = outLC p (a,(b,c))) (outAux p Block(a b c d) = Block (outAux p a) (outAux p b) (outAux p c) (outAux p d))|
%
\just\equiv{Def-comp, Def-x, Igualdade extencional}
%
|lcbr(outAux p.Cell = outLC p)(outAux p.Block = Block.outAux^4)|
%
\just\equiv{Eq-+, Fusão-+, Functor-id-x, Natural-id}
%
|outAux p . either(Cell) (Block) = either (outLC p. (id >< id)) (Block.outAux^4)|
%
\just\equiv{Definição inQTree, Absorção-+, Cancelamento-+}
|outAux p. inQTree = (either (outLC p) (inQTree.i2)).(id><id + outAux^4) |
%
\just\equiv{Universal-cata}
|outAux p = cataQTree ((either (outLC p) (inQTree.i2)))|
%
\end{eqnarray*}
\par{Aplicando as Leis do Cálculo funcional chegamos ao catamorfismo: }
\begin{code}
outAux p = cataQTree (either (outLC p) (inQTree . i2)) 
\end{code}

\par{A função \textit{outLC} verifica se um pixel é de fundo, em caso afirmativo constrói um bloco em que as células do interior são Falsas e do exterior Verdadeiras. Caso contrário, fica tudo a Falso.}
\begin{eqnarray*}
\start
%
|outLC p (a,(x,y)) = if p a then outLB x y else Cell False x y|
%
\just\equiv{Def-const, Def-cond}
%
|outLC p (a,(x,y)) = p -> const(outLB x y) (const (Cell False x y)) a |
%
\end{eqnarray*}

\begin{code}  
outLC p (a, (x, y)) = cond p (const (outLB x y)) (const (Cell False x y)) a
\end{code}

\par{Função responsável por construir um bloco com as células do interior a Falso e as exteriores a Verdadeiro.}
\begin{code}
outLB x y = Block
    (Block (Cell True 1 1)
           (Cell True (x-2) 1)
           (Cell True 1 (y-2))
           (Cell False (x-2) (y-2)))
    (Cell True 1 (y-1))
    (Cell True (x-1) 1)
    (Cell True 1 1)
\end{code}
\par{Nesta função pretende-se converter uma quadtree numa matriz monocromática, para tal convertemos a quadtree proveniente da \textit{outAux} na matriz pretendida.}
\begin{code}
outlineQTree p = qt2bm . (outAux p)
\end{code}

\subsection*{Problema 3}
\par{Começamos por escrever f k como um catamorfismo:}
\begin{eqnarray*}
\start
%
|lcbr(f k 0 = 1)(f k (d+1) = l k d >< f k d)|
%
\just\equiv{Igualdade extensional, Def-comp, Definição succ e mul, Def-split, Def-const}
%
|lcbr(f k.(const 0) = const 1)(f k.succ = mul.(split fk lk))|
%
\just\equiv{Definição inNat, Eq-+, Fusão-+}
|f k . inNat = either(const 1) (mul.(split (f k) (l k)))|
%
\just\equiv{Absorção-+, Natural-id}
|f k . inNat = (either(const 1) (mul)) . (id >< (split (f k) (l k))) |
%
\end{eqnarray*}
\par{E fazemos o mesmo para l k:}
\begin{eqnarray*}
\start
%
|lcbr(l k 0 = k + 1)(l k (d+1) = l k d + 1)|
%
\just\equiv{Igualdade extensional, Def-comp, Definição succ, Def-const}
%
|lcbr(l k.(const 0) = (const(k + 1)))(l k.succ = succ.l k)|
%
\just\equiv{Cancelamento-x}
%
|lcbr(l k.(const 0) = (const(k + 1)))(l k.succ = succ.p2.(split (fk) (lk)))|
%
\just\equiv{Definição inNat, Eq-+, Fusão-+}
|l k. inNat = either(const(k + 1)) (succ.p2.(split (fk) (lk)))|
%
\just\equiv{Absorção-+}
|l k. inNat = (either(const(k + 1)) (succ.p2)) . (id >< (split (fk) (lk))) |
%
\end{eqnarray*}

\begin{eqnarray*}
\start
%
|lcbr(fk . in = (either (const 1) (mul)) . F(split g s) )(lk.in = (either (const(k + 1)) (succ.p2)).F(split g s))|
%
\just\equiv{Fokkinga}
%
|(split fk lk) = cataNat(split (either(const 1) (mul)) (either(const(k + 1)) (succ.p2)))|
%
\end{eqnarray*}

\par{Aplicando a lei da recursividade múltipla verificamos que: }

\begin{eqnarray*}
|(split fk lk) = cataNat(split (either(const 1) (mul)) (either(const(k + 1)) (succ.p2)))|
\end{eqnarray*}

\par{Começamos por escrever g como um catamorfismo:}

\begin{eqnarray*}
\start
%
|lcbr(g 0 = 1)(g (d+1) = s d >< g d)|
%
\just\equiv{Igualdade extensional, Def-comp, definição mul, def-split, Def-const}
%
|lcbr(g.(const 0) = const 1)(g.succ = mul.(split g s))|
%
\just\equiv{Definição inNat, Eq-+, Fusão-+}
|g . inNat = either(const 1) (mul.(split g s))|
%
\just\equiv{Absorção-+}
|g . inNat = (either(const 1) (mul)) . (id >< (split g s)) |
%
\end{eqnarray*}

\par{E aplicamos o mesmo método a s:}

\begin{eqnarray*}
\start
%
|lcbr(s 0 = 1)(s (d+1) = s d + 1)|
%
\just\equiv{Igualdade extensional, Def-comp, definição succ, Def-const}
%
|lcbr(s.(const 0) = const 1)(s.succ = succ.s)|
%
\just\equiv{Cancelamento-x}
%
|lcbr(s.(const 0) = const 1)(s.succ = succ.p2.(split g s))|
%
\just\equiv{Definição inNat, Eq-+ e Fusão-+}
|s. inNat = either(const 1) (succ.p2.(split g s))|
%
\just\equiv{Absorção-+}
|s.inNat = (either(const 1) (succ.p2)) . (id >< (split g s)) |
%
\end{eqnarray*}

\begin{eqnarray*}
\start
%
|lcbr(g . in = (either (const 1) (mul)) . F(split g s) )(s.in = (either (const 1) (succ.p2)).F(split g s))|
%
\just\equiv{Fokkinga}
%
|(split g s) = cataNat(split (either(const 1) (mul)) (either(const 1) (succ.p2)))|
%
\end{eqnarray*}

\par{Do mesmo modo temos que: }

\begin{eqnarray*}
%
|(split g s) = cataNat(split (either(const 1) (mul)) (either(const 1) (succ.p2)))|
%
\end{eqnarray*}

\par{Combinando os resultados para aplicar a lei de banana-split temos: }

\begin{eqnarray*}
\start
%
|split(cataNat(split (either(const 1) (mul)) (either(const(k+1)) (succ.p2))))(cataNat(split (either(const 1) (mul)) (either(const 1) (succ.p2))))|
%
\just\equiv{Lei da troca}
%
|split(cataNat(either (split (const 1) (const(k+1))) (split (mul) (succ.p2)))) (cataNat(either (split (const 1) (const 1)) (split (const 1) (succ.p2)))) |
%
\just\equiv{Banana-split}
%
|cataNat(either (split (const 1) (const(k+1))) (split (mul) (succ.p2)) >< either (split (const 1) (const 1)) (split (const 1) (succ.p2))). (split (F p1) (F p2)) |
%
\just\equiv{F f = id + f}
%
|cataNat(either (split (const 1) (const(k+1))) (split (mul) (succ.p2)) >< either (split (const 1) (const 1)) (split (const 1) (succ.p2))). (split (id + p1) (id + p2)) |
%
\just\equiv{Absorção-x}
%
|cataNat(split ((either (split (const 1) (const (k+1))) (split mul (succ.p2))).(id + p1)) ((either (split (const 1) (const 1)) (split mul (succ.p2))).(id + p2)))|
%
\just\equiv{Absorção-+, Natural-id}
%
|cataNat(split (either (split (const 1) (const (k+1))) (split mul (succ.p2).p1)) (either (split (const 1) (const 1)) (split mul (succ.p2) . p2)))|
%
\just\equiv{Fusão-x}
%
|cataNat(split (either (split (const 1) (const (k+1))) (split (mul.p1) (succ.p2.p1))) (either (split (const 1) (const 1)) (split (mul.p2) (succ.p2.p2))))|
%
\just\equiv{Lei da troca}
%
|cataNat(either(split (split (const 1) (const(k+1))) (split (const 1) (const 1))) (split (split (mul.p1) (succ.p2)) (split (mul.p2) (suc.p2.p2))))|
%
\just\equiv{|split (const a) (const s)| = (a,b)}
%
|cataNat(either (((1,k+1),(1,1))) (split (split (mul.p1) (succ.p2)) (split (mul.p2) (suc.p2.p2))))|
%
\end{eqnarray*}

\par{Sabendo que |for b i = cataNat(either (const i) b)| temos que:}

\begin{code}
base k = toPair ((1,k+1),(1,1))
loop = toPair.(split (split (mul.p1) (succ.p2.p1)) (split (mul.p2) (succ.p2.p2))).desPair
\end{code}

\begin{code}
toPair :: ((Integer,Integer),(Integer,Integer)) -> (Integer,Integer,Integer,Integer)
toPair ((a,b),(c,d)) = (a,b,c,d)
desPair :: (Integer,Integer,Integer,Integer) -> ((Integer,Integer),(Integer,Integer))
desPair (a,b,c,d) = ((a,b),(c,d))
\end{code}

\subsection*{Problema 4}

\begin{code}
uncurryFTree f = \(x,(y,z)) -> f x y z
inFTree = either (Unit) (uncurryFTree Comp)
outFTree (Unit b) = Left b  
outFTree (Comp a b c) = Right(a,(b,c))
baseFTree g f h = f -|- (g  >< (h >< h))
recFTree f = baseFTree id id f
cataFTree g = g . (recFTree (cataFTree g)) . outFTree
anaFTree f = inFTree . (recFTree (anaFTree f) ) . f
hyloFTree f g = cataFTree f . anaFTree g

instance Bifunctor FTree where
    bimap f g = cataFTree (inFTree . baseFTree f g id)
\end{code}

\par{A \textit{generatePTree} pretende gerar uma árvore de pitágoras para uma dada ordem. De modo a solucionar o problema optamos por iniciar a construção da árvore de níveis superiores para os inferiores. Os quadrados constituintes são redimensionados pela escala de |(sqrt 2)/2| de níveis inferiores para os superiores, o que corresponderá a uma aumento no tamanho de |sqrt 2| na nossa resolução. Desta forma, elaboramos a seguinte função em Haskell:}
\begin{eqnarray*}
\start
%
|lcbr(generatePTree 0 = Unit 1)(generatePTree (n+1) = Comp (sqrt(2)^(n+1)) (generatePTree n) (generatePTree n) |
%
\just\equiv{Def-comp, Def-const, Def-split, Igualdade Extencional}
%
|lcbr(generatePTree.(const 0) = Unit.(const 1)) (generatePTree.succ = Comp.(split ((sqrt(2)^).succ) (split (generatePTree) (generatePTree)) ))|
%
\just\equiv{Absorção-x}
%
|lcbr(generatePTree.(const 0) = Unit.(const 1)) (generatePTree.succ = Comp.(split ((sqrt(2)^).succ) ((generatePTree^2).(split id id))))|
%
\just\equiv{Absorção-x}
|lcbr(generatePTree.(const 0) = Unit.(const 1)) (generatePTree.succ = Comp.((id >< (generatePTree^2)).(split ((sqrt(2)^).succ) (split id id))))|
%
\just\equiv{Fusão-+, Eq-+}
|generatePTree. (either (const 0) (succ)) = either (Unit.(const 1)) (Comp.((id >< (generatePTree^2).(split ((sqrt(2)^).succ) (split id id))))))|
%
\just\equiv{Definição inNat, Absorção-+}
|generatePTree. inNat = (either (Unit) (Comp)) . ((const 1) + ((id >< (generatePTree^2).(split ((sqrt(2)^).succ) (split id id))))|
%
\just\equiv{Definição inFTree, Functor-+, Natural-id}
|generatePTree. inNat = inFTree . (id+id>< generatePTree^2).((const 1) + (split ((sqrt(2)^).succ) (split id id)))|
%
\just\equiv{Definição |F f = id + id >< f|, isomorfismo inFTree = outFTree e inNat = outNat}
|outFTree.generatePTree = (F generatePTree).((const 1) + (split ((sqrt(2)^).succ) (split id id))). outNat|
%
\just\equiv{Universal-ana}
|generatePTree = anaFTree(((const 1) + (split ((sqrt(2)^).succ) (split id id))). outNat)|
%
\end{eqnarray*}

\par{Desta forma, a \textit{generatePTree} como anamorfismo é:}
\begin{code}
generatePTree = anaFTree (((const 1) -|- (split ((sqrt(2) ^) . succ) (split id id))) . outNat)
\end{code}

\par{A função auxiliar \textit{ptreeGenerate} gera a árvore de pitágoras de ordem n com o tamanho desejado. A \textit{ptreeDraw} cria a lista de imagens de todos os quadrados necessários para criar a \textit{PTree}. Enquanto que a \textit{transformaL} transforma a lista de imagens que representa os quadrados necessários à construção da \textit{PTree} numa lista de imagens correspondentes a cada frame a apresentar na animação. Estas três funções auxiliam a \textit{drawPTree} que é responsável por gerar a lista de imagens a representar aquando da construção da árvore de Pitágoras.}
\begin{code}
ptreeGenerate :: Int -> PTree
ptreeGenerate n = aux n 100 where 
   aux :: Int -> Float -> PTree 
   aux 0 x = Unit x
   aux n x = Comp x (aux (n-1) (x * (sqrt(2)/2))) (aux (n-1) (x * (sqrt(2)/2))) 

ptreeDraw :: PTree -> Float -> (Float,Float) -> [Picture]
ptreeDraw (Unit a) ang (x,y) =  [Translate x y (Rotate ang(square a))]
ptreeDraw (Comp a e d) ang (x,y) = [Translate x y (Rotate ang(square a))] ++
                                    (ptreeDraw e  (ang - 45) (x + somaXLeft,y + somaYLeft)) ++ 
                                    (ptreeDraw d  (ang + 45) (x + somaXRight,y + somaYRight))
                           where  
                            somaX = a/2
                            angRads = ang * pi / 180
                            branchToGlobal angle (dx,dy) = (dx * cos angle + dy * sin angle, dy * cos angle - dx * sin angle)
                            (somaXLeft, somaYLeft) = branchToGlobal angRads (-somaX,a)
                            (somaXRight, somaYRight) = branchToGlobal angRads (somaX,a)

transformaL :: Int -> [Picture]
transformaL  0 = [pictures(ptreeDraw (ptreeGenerate 1) 0 (0,0))]
transformaL  n = (pictures(ptreeDraw (ptreeGenerate (n+1)) 0 (0,0))) : transformaL (n-1)

drawPTree fig = reverse(transformaL(depthFTree fig))
\end{code}

\subsection*{Problema 5}
\par{Primeiro é necessário construir um par cujo primeiro elemento é a cor do Marble e o segundo um inteiro. Para tal, recorrendo ao \textit{split} criamos o par desejado. De seguida é criada uma lista com o anterior através do \textit{singl}. Por último, utilizando o construtor B elaboramos a Bag.}
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |a|
      \ar[d]_-{singletonBag}
      \ar[r]_-{|split (id) (const 1)|}
&
    |(a,Int)|
      \ar[d]^{|singl|}
\\
     |Bag a|
&
     |[(a,Int)]|
      \ar[l]^-{|B|}
}
\end{eqnarray*}

\begin{code}
singletonbag = B . singl.split(id) (const 1)
\end{code}

\par{Dado que recebemos um saco com vários sacos, recorremos à \textit{unB} para abrir os sacos. Após estarem abertos, verificamos os sacos que são iguais e procedemos à multiplicação do número de Marbles com uma dada cor pelo número de sacos iguais, sendo esta informação armazenada numa lista de túplos. Por fim, utilizando o construtor B, ficamos com uma única Bag com toda a informação. }


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Bag(Bag a)|
      \ar[d]_-{|muB|}
      \ar[r]_-{|fmap unB|}
&
    |Bag [(a,Int)]|
      \ar[d]^{|retiraBags|}
\\
     |Bag a|
&
     |[(a,Int)]|
      \ar[l]^-{B}
}
\end{eqnarray*}

\begin{code}
retiraBags :: Bag [(a, Int)] -> [(a, Int)]
retiraBags = concat . (map multiplica) . unB
multiplica :: ([(a, Int)], Int) -> [(a, Int)]
multiplica ([],_) = []
multiplica (((a,b):t),c) = [(a,b*c)] ++ multiplica (t,c)
\end{code}
\begin{code}
muB = B . retiraBags . (fmap unB)
\end{code}
\par{Para elaborarmos a função \textit{dist} recorremos a três funções auxiliares, a \textit{numM} que devolve o número total de Marbles, a \textit{probM} que constrói uma lista de túplos em que o segundo elemento representa a probabilidade de cada cor e a \textit{sProb} que devolve o pretendido. Note-se que a \textit{Bag} utilizada para calcular a probabilidade não contém elementos repetidos. Assim, a função \textit{dist} retorna a probabilidade de cada cor dos berlindes contidos no Bag recebido.}
\begin{code}

sProb (B a) num = D (probM a num)

probM :: [(a, Int)] -> Int -> [(a, ProbRep)]
probM [] _ = []
probM ((t, n) : h) num = [(t, (((fromIntegral n)/(fromIntegral num))))] ++ probM h num

numM :: Bag a -> Int
numM (B []) = 0
numM (B ((t, n) : h)) = n + numM (B h)
\end{code}
\begin{code}
dist a = sProb (consolidate a) (numM a)
\end{code}

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Outras definições auxiliares -------------------------------------------%

%if False
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

newtype Nat = Nat {getNat :: Int}
 deriving ( Eq, Ord, Show, Enum, Read, Typeable)

instance Arbitrary Nat where
  arbitrary =
    (frequency
       [ (5, (Nat . abs) `fmap` arbitrary)
       , (1, return (Nat 0))
       ]
    ) `suchThat` ge0
    where ge0 (Nat x) = x >= 0

  shrink (Nat x) =
    [ Nat x'
    | x' <- shrink x
    , x' >= 0
    ]

newtype SmallNat = SmallNat Int
 deriving ( Eq, Ord, Show, Read,Enum,Num,Typeable)

instance Arbitrary SmallNat where
  arbitrary = liftM SmallNat (QuickCheck.choose (0,10))

  shrink (SmallNat x) =
    [ SmallNat x'
    | x' <- shrink x
    , x' >= 0, x' <= 10
    ]
    
instance Arbitrary a => Arbitrary (Matrix a) where
  arbitrary = do
    rows <- QuickCheck.choose (0,100)
    cols <- QuickCheck.choose (0,100)
    xs <- vectorOf (rows * cols) arbitrary
    return (fromList rows cols xs)
  shrink = shrinkNothing

minusNat :: Int -> Int -> Int
minusNat x = Nat.for predNat x

predNat :: Int -> Int
predNat 0 = 0
predNat n = n - 1

-- * pergunta 1

data Blockchain = Bc {bc :: Block}  |  Bcs {bcs :: (Block, Blockchain)} deriving Show
type Block = (MagicNo, (Time, Transactions))
type Transaction = (Entity, (Value, Entity))
type Transactions = [Transaction]
type Ledger = [(Entity, Value)]
type MagicNo = String
type Time = Int  -- em milisegundos
type Entity = String
type Value = Int

inBlockchain :: Either Block (Block, Blockchain) -> Blockchain
outBlockchain :: Blockchain -> Either Block (Block, Blockchain)
recBlockchain :: (c -> d) -> Either b1 (b2, c) -> Either b1 (b2, d)
cataBlockchain :: (Either Block (Block, d) -> d) -> Blockchain -> d
anaBlockchain :: (c -> Either Block (Block, c)) -> c -> Blockchain
hyloBlockchain :: (Either Block (Block, c1) -> c1) -> (c2 -> Either Block (Block, c2)) -> c2 -> c1

list2chain [] = Bc ("numeromagico1", (0, []))
list2chain [b] = Bc b
list2chain (h:t) = Bcs (h, list2chain t)

instance Arbitrary Blockchain where
  arbitrary = do
    xs <- arbitrary
    -- nao convem ter numeros repetidos
    return $ list2chain $ nubBy (\(n, _) (n', _) -> n /= n') xs
  shrink = shrinkNothing

e1 = "ent1"
e2 = "ent2"

mg1 = "b1"
mg2 = "b2"
mg3 = "b3"

tm1 = 1
tm2 = 2
tm3 = 3

t1 = (e1, (100, e2))
t2 = (e2, (50, e1))

bl1, bl2, bl3 :: Block
bl1 = (mg1, (tm1, []))
bl2 = (mg2, (tm2, [t1]))
bl3 = (mg3, (tm3, [t2]))

bs1, bs2 :: Blockchain
bs1 = Bcs (bl1, Bcs (bl2, Bc bl3))
bs2 = Bcs (bl3, Bcs (bl2, Bc bl2))
bs3 = Bc bl2
bs4 = Bcs (bl1, Bc bl3)


reverseChain :: Blockchain -> Blockchain
reverseChain = cataBlockchain (either Bc snocChain)


snocChain :: (Block, Blockchain) -> Blockchain
snocChain (b, Bc b') = Bcs (b', Bc b)
snocChain (b, Bcs (b', bs)) = Bcs (b', snocChain (b, bs))


concChain :: (Blockchain, Blockchain) -> Blockchain
concChain (b1, (Bc b)) = snocChain (b, b1)
concChain (b1, (Bcs (b, bs))) = concChain ((snocChain (b, b1)), bs)


lenChain = cataBlockchain (either (const 1) (succ . p2))

-- * pergunta 2

data QTree a = Cell a Int Int | Block (QTree a) (QTree a) (QTree a) (QTree a)
  deriving (Eq,Show)
  
inQTree :: Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a))) -> QTree a
outQTree :: QTree a -> Either (a, (Int, Int)) (QTree a, (QTree a, (QTree a, QTree a)))
baseQTree :: (a1 -> b) -> (a2 -> d1) -> Either (a1, d2) (a2, (a2, (a2, a2))) -> Either (b, d2) (d1, (d1, (d1, d1)))
recQTree :: (a -> d1) -> Either (b, d2) (a, (a, (a, a))) -> Either (b, d2) (d1, (d1, (d1, d1)))
cataQTree :: (Either (b, (Int, Int)) (d, (d, (d, d))) -> d) -> QTree b -> d
anaQTree :: (a1 -> Either (a2, (Int, Int)) (a1, (a1, (a1, a1)))) -> a1 -> QTree a2
hyloQTree :: (Either (b, (Int, Int)) (c, (c, (c, c))) -> c) -> (a -> Either (b, (Int, Int)) (a, (a, (a, a)))) -> a -> c

instance (Eq a,Arbitrary a) => Arbitrary (QTree a) where
  arbitrary = do
    rows <- QuickCheck.choose (1,100)
    cols <- QuickCheck.choose (1,100)
    xs <- vectorOf (rows * cols) arbitrary
    return ((bm2qt . fromList rows cols) xs)
  shrink = shrinkNothing

rotateMatrix :: Matrix a -> Matrix a
rotateMatrix m = matrix (ncols m) (nrows m) rot
    where
    rot (j,i) = unsafeGet (nrows m - i + 1) j m

rotatebm :: Eq a => Matrix a -> Matrix a
rotatebm = qt2bm . rotateQTree . bm2qt

rotateBMP :: FilePath -> FilePath -> IO ()
rotateBMP from to = withBMP from to rotatebm

instance Arbitrary PixelRGBA8 where
    arbitrary = do
        r <- px
        g <- px
        b <- px
        a <- px
        return (PixelRGBA8 r g b a)
      where px = QuickCheck.choose (0,255)
    shrink = shrinkNothing

sizeMatrix :: Matrix a -> (Int,Int)
sizeMatrix = ncols `split` nrows
    
sizeQTree :: QTree a -> (Int,Int)
sizeQTree = cataQTree (either snd g)
    where
    g (a,(b,(c,d))) = (fst a + fst b,snd a + snd c)

shapeQTree :: QTree a -> QTree ()
shapeQTree = fmap (!)

scalebm :: Eq a => Int -> Matrix a -> Matrix a
scalebm s = qt2bm . scaleQTree s . bm2qt

scaleBMP :: Int -> FilePath -> FilePath -> IO ()
scaleBMP s from to = withBMP from to (scalebm s)

invertbm :: Matrix PixelRGBA8 -> Matrix PixelRGBA8
invertbm = qt2bm . invertQTree . bm2qt

invertBMP :: FilePath -> FilePath -> IO ()
invertBMP from to = withBMP from to invertbm

depthQTree :: QTree a -> Int
depthQTree = cataQTree (either (const 0) f)
    where f (a,(b,(c,d))) = maximum [a,b,c,d]

compressbm :: Eq a => Int -> Matrix a -> Matrix a
compressbm n = qt2bm . compressQTree n . bm2qt

compressBMP :: Int -> FilePath -> FilePath -> IO ()
compressBMP n from to = withBMP from to (compressbm n)

outlinebm :: Eq a => (a -> Bool) -> Matrix a -> Matrix Bool
outlinebm isBackground = outlineQTree isBackground . bm2qt

outlineBMP :: FilePath -> FilePath -> IO ()
outlineBMP from to = withBMP from to (fmap mono . outlinebm (==whitePx))
    where
    mono False = whitePx
    mono True = blackPx
    
addOutlineBMP :: FilePath -> FilePath -> IO ()
addOutlineBMP from to = withBMP from to joinbm
    where
    joinbm bm = elementwiseUnsafe joinpx bm (outlinebm (==whitePx) bm)
    joinpx px1 False = px1
    joinpx px1 True = blackPx

qtOut = fromLists 
    [[  True, True, True, True, True, True, True, True ]
    ,[  True,False,False, True, True, True, True, True ]
    ,[  True,False,False, True,False,False,False, True ]
    ,[  True, True, True, True,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False,False,False, True, True ]
    ,[ False,False,False,False, True, True, True, True ]
    ,[ False,False,False,False, True, True, True,False ]
    ]

bm = fromLists [
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0],
    [0,0,0,0,1,1,1,0],
    [0,0,0,0,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,1,1,0,0],
    [1,1,1,1,0,0,0,0],
    [1,1,1,1,0,0,0,1]]

qt = bm2qt bm

-- * pergunta 4

data FTree a b = Unit b | Comp a (FTree a b) (FTree a b) deriving (Eq,Show)
type PTree = FTree Square Square
type Square = Float

inFTree :: Either b (a, (FTree a b, FTree a b)) -> FTree a b
outFTree :: FTree a1 a2 -> Either a2 (a1, (FTree a1 a2, FTree a1 a2))
baseFTree :: (a1 -> b1) -> (a2 -> b2) -> (a3 -> d) -> Either a2 (a1, (a3, a3)) -> Either b2 (b1, (d, d))
recFTree :: (a -> d) -> Either b1 (b2, (a, a)) -> Either b1 (b2, (d, d))
cataFTree :: (Either b1 (b2, (d, d)) -> d) -> FTree b2 b1 -> d
anaFTree :: (a1 -> Either b (a2, (a1, a1))) -> a1 -> FTree a2 b
hyloFTree :: (Either b1 (b2, (c, c)) -> c) -> (a -> Either b1 (b2, (a, a))) -> a -> c

depthFTree :: FTree a b -> Int
depthFTree = cataFTree (either (const 0) g)
    where g (a,(l,r)) = max l r + 1
    
isBalancedFTree :: FTree a b -> Bool
isBalancedFTree = isJust . cataFTree (either (const (Just 0)) g)
    where
    g (a,(l,r)) = join (liftA2 equal l r)
    equal x y = if x == y then Just (x+1) else Nothing
\end{code}
%endif

%----------------- Fim do documento -------------------------------------------%

\end{document}

