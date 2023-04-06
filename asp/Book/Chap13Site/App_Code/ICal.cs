using System.ServiceModel;

[ServiceContract]
public interface ICal
{
  [OperationContract]
  int Add(int a, int b);
  [OperationContract]
  int Subtract(int a, int b);
}
