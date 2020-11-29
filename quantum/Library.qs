namespace Quantum.Samples.RandomGen {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Random bit Generator
    operation CreateQuantumRandomNumberGenerator() : Result {
        using (q = Qubit())  {  // qubit を割り当てる
            H(q);               // qubit を初期化し重ね合わせ状態とする
            return MResetZ(q);  // qubit の値を観測する
        }
    }

   // Random number Generator
    operation CreateRandomNumberInRange(max : Int) : Int {
        mutable bits = new Result[0]; // bit 列の定義
        for (idxBit in 1..BitSizeI(max)) {
            set bits += [CreateQuantumRandomNumberGenerator()]; //生成した乱数bitを結合させる
        }
        let result = ResultArrayAsInt(bits);
        return result > max
               ? CreateRandomNumberInRange(max)
               | result;
    }
}