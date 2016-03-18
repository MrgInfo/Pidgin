namespace MrgInfo.Pidgin.Console
{
    using Antlr4.Runtime;
    using Compiler;
    using static System.Console;

    static class Program
    {
        const string PidginSample = 
@"{ 
    1 = 2, 
  2 = {}, 
  3 }
";

        static void Main()
        {
            var inputStream = new AntlrInputStream( PidginSample.TrimStart() );
            var lexer = new BasicLexer( inputStream );
            var commonTokenStream = new CommonTokenStream( lexer );
            var parser = new BasicParser( commonTokenStream );
            var context = parser.message();
            WriteLine( context );
            ReadKey( true );
        }
    }
}
