import * as React from "react";
import { connect } from "react-redux";

//@ts-ignore
import * as Braintree from "braintree-web";

import { State as ReduxState, ScopedThunkDispatch } from "ui/reducer";
import { getClientTokenAction } from "ui/checkout/actions";
import CreditCardForm from "ui/checkout/CreditCardForm";
import PaypalButton from "ui/checkout/PaypalButton";
import ErrorMessage from "ui/common/ErrorMessage";

interface OwnProps {}
interface StateProps {
  clientToken: string;
  isRequesting: boolean;
}
interface DispatchProps {
  getClientToken: () => void;
}
interface Props extends DispatchProps, OwnProps, StateProps {}

interface State {
  braintreeInstance: any;
  braintreeError: Braintree.BraintreeError;
  paymentMethodNonce: string;
}

class CheckoutForm extends React.Component<Props, State> {

  constructor(props: Props) {
    super(props);

    this.state = {
      braintreeError: undefined,
      paymentMethodNonce: undefined,
      braintreeInstance: undefined,
    }
  }
  public componentDidMount() {
    this.props.getClientToken();
  }

  public componentDidUpdate(prevProps: Props) {
    const { isRequesting: wasRequesting } = prevProps;
    const { isRequesting, clientToken } = this.props;

    if (wasRequesting && !isRequesting && !!clientToken) {
      this.initBraintree();
    }
  }

  private initBraintree = async () => {
    const { clientToken } = this.props;

    try {
      await Braintree.client.create({
        authorization: clientToken,
      }, (err, clientInstance) => {
        if (err) throw err;
        this.setState({ braintreeInstance: clientInstance });
      });
    } catch (err) {
      console.log(err);
      this.setState({ braintreeError: err });
    }
  }

  public render(): JSX.Element {
    const { braintreeError, braintreeInstance } = this.state;
    const { isRequesting, clientToken } = this.props;
    return (
      <>
        <CreditCardForm
          braintreeInstance={braintreeInstance}
        />
        <PaypalButton
          braintreeInstance={braintreeInstance}
        />
        {!isRequesting && braintreeError && braintreeError.message && <ErrorMessage error={braintreeError.message} />}
      </>        
    );
  }
}

const mapStateToProps = (state: ReduxState, _ownProps: OwnProps): StateProps => {
  const { isRequesting, clientToken } = state.checkout;

  return {
    isRequesting,
    clientToken
  }
}

const mapDispatchToProps = (
  dispatch: ScopedThunkDispatch
): DispatchProps => {
  return {
    getClientToken: () => dispatch(getClientTokenAction()),
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CheckoutForm);