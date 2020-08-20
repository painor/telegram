import 'dart:io';
import 'dart:math';
import '../utils.dart';

class Factorizator {
  /**
   * Calculates the greatest common divisor
   * @param a {BigInteger}
   * @param b {BigInteger}
   * @returns {BigInteger}
   */
  static gcd(BigInt a, BigInt b) {
    while (b != BigInt.zero) {
      BigInt temp = b;
      b = a.remainder(b);
      a = temp;
    }
    return a;
  }

  /**
   * Factorizes the given number and returns both the divisor and the number divided by the divisor
   * @param pq {BigInteger}
   * @returns {{p: *, q: *}}
   */
  static Map<String, BigInt> factorize(BigInt pq) {
    var rng = new Random();

    if (pq.remainder(BigInt.two) == (BigInt.zero)) {
      return {'p': BigInt.two, 'q': BigInt.from(pq / (BigInt.two))};
    }
    BigInt y = BigInt.from(rng.nextInt((pq - BigInt.one).toInt().toUnsigned(32)) + 1);
    final BigInt c = BigInt.from(rng.nextInt((pq - BigInt.one).toInt().toUnsigned(32)) + 1);
    final BigInt m = BigInt.from(rng.nextInt((pq - BigInt.one).toInt().toUnsigned(32)) + 1);

    BigInt g = BigInt.one;
    BigInt r = BigInt.one;
    BigInt q = BigInt.one;
    BigInt x = BigInt.zero;
    BigInt ys = BigInt.zero;
    BigInt k;

    while (g == (BigInt.one)) {

      x = y;
      for (var i = 0; BigInt.from(i) < r; i++) {
        y = (y.modPow(BigInt.two, pq) + c).remainder(pq);
      }
      k = BigInt.zero;

      while (k < r && g == BigInt.one) {
        ys = y;
        var condition = minBigInt(m, r - k);
        for (var i = 0; BigInt.from(i) < (condition); i++) {
          y = (y.modPow(BigInt.two, pq) + c).remainder(pq);
          q = q * ((x - y).abs()).remainder(pq);
        }
        g = Factorizator.gcd(q, pq);
        k = k + m;
      }

      r = r * BigInt.two;
    }

    if (g == (pq)) {
      while (true) {
        ys = (ys.modPow(BigInt.two, pq) + c).remainder(pq);
        g = Factorizator.gcd((x - ys).abs(), pq);

        if (g > BigInt.one) {
          break;
        }
      }
    }
    final BigInt p = g;
    q = BigInt.from(pq / g);
    return p < q ? {'p': p, 'q': q} : {'p': q, 'q': p};
  }
}
