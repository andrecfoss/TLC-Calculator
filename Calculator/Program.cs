using Antlr4.Runtime;
using Calculator;

Console.WriteLine( "ANTLR Calculator - Version 1.0" );

Console.Write( "> " );
for ( var buffer = Console.ReadLine() ;
      ! string.IsNullOrEmpty( buffer ) ;
      buffer = Console.ReadLine() )
{
    var stream = CharStreams.fromString( buffer );
    var lexer  = new CalculatorLexer( stream );
    var tokens = new CommonTokenStream( lexer );

    var parser = new CalculatorParser( tokens );
    parser.BuildParseTree = true;

    var visitor = new CalculatorEngine();
    var value = visitor.Visit( parser.computation() );

    Console.WriteLine( $"= {value}" );
    Console.Write( "> " );
}

