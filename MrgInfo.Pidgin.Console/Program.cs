namespace MrgInfo.Pidgin.Console
{
    using Antlr4.Runtime;
    using Compiler;
    using static System.Console;

    static class Program
    {
        const string PidginSample = @"
{
    2=6,
    7 = { 1,2,3   },
    +9 = h5A,
 b1111 = { -1 },
    2/3 = 2016-01-01T00:00:00,
    { .78, 12.34, 7e56 },
    6 = 10>20,
    10@45 = [alma meg a fája]
}";

        static void Main()
        {
            var inputStream = new AntlrInputStream(
                PidginSample
                .TrimStart()
                .Replace( '\r', '\n' )
                .Replace( '\v', '\n' )
                .Replace( '\t', ' ' )
                .Replace( '\f', ' ' ) );
            var lexer = new SmartLexer( inputStream );
            var commonTokenStream = new CommonTokenStream( lexer );
            var parser = new SmartParser( commonTokenStream );
            var context = parser.message();
            WriteLine( context.GetText() );
            ReadKey( true );
        }
    }
}
