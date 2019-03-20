import * as React from "react";
import AsyncSelect, { Props as AsyncProps } from 'react-select/lib/Async';
import { formDialogClass } from "ui/common/FormModal";
import { SelectOption } from "ui/common/RenewalForm";
import Form from "ui/common/Form";
import { ActionMeta } from "react-select/lib/types";

interface Props extends AsyncProps<any> {
  name: string;
  getFormRef?: () => Form;
}

const AsyncSelectFixed: React.SFC<Props> = (props) => {
  // Capture onChange to update Form if defined
  const onChange = (option: SelectOption, action: ActionMeta) => {
    const form = props.getFormRef && props.getFormRef();
    if (form) {
      form.setValue(props.name, option);
      form.setError(props.name, undefined);
    }
    props.onChange(option, action);
  }

  const formDialog = document.getElementsByClassName(formDialogClass)[0];
  const modifiedProps = {
    ...props,
    ...formDialog && {
      menuPortalTarget: formDialog as HTMLElement
    },
    onChange
  }
  return <AsyncSelect {...modifiedProps } />
}


export default AsyncSelectFixed;