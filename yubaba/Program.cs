using System;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Simulators;
using Quantum.Samples.RandomGen;

namespace Quantum.Samples.Yubaba
{
    class Yubaba
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("契約書だよ。そこに名前を書きな。");
            String name = Console.ReadLine();
            Console.WriteLine($"フン。{name}というのかい。贅沢な名だねぇ。");

            using var sim = new QuantumSimulator(); //量子シミュレータの生成
            var randomNum = await CreateRandomNumberInRange.Run(sim, name.Length-1); //Q#メソッドの call

            var newName = name[(int)randomNum];
            Console.WriteLine($"今からお前の名前は{newName}だ。いいかい、{newName}だよ。分かったら返事をするんだ、{newName}!!");
        }
    }
}