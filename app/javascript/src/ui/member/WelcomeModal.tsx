import * as React from "react";

import FormModal from "ui/common/FormModal";
import Form from "ui/common/Form";

interface Props {
  isOpen: boolean;
  isRequesting: boolean;
  error: string;
  onSubmit: (form: Form) => void;
}

interface State {
  submitText: string;
}

class WelcomeModal extends React.Component<Props, State> {
  public formRef: Form;
  private setFormRef = (ref: Form) => this.formRef = ref;

  constructor(props: Props){
    super(props);
    this.state = { submitText: "Continue" };
  }

  public render(): JSX.Element {
    const { isOpen, isRequesting, error, onSubmit } = this.props;

    return (
      <FormModal
        formRef={this.setFormRef}
        id="welcome-modal"
        loading={isRequesting}
        isOpen={isOpen}
        title="Welcome to Manchester Makerspace"
        onSubmit={onSubmit}
        submitText="Save"
        error={error}
      >
       Welcome!
      </FormModal>
    )
  }
}

export default WelcomeModal;
