defmodule EthereumRPCTest do
  use ExUnit.Case
  doctest EthereumRPC

  test "greets the world" do
    assert EthereumRPC.hello() == :world
  end
end
