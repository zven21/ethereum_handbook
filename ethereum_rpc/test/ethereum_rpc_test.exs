defmodule EthereumRpcTest do
  use ExUnit.Case
  doctest EthereumRpc

  test "greets the world" do
    assert EthereumRpc.hello() == :world
  end
end
